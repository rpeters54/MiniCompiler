import logging
import os
import subprocess
import difflib
import typing
from typing import List
from subprocess import PIPE

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)

semantics_path = 'tests/semantics'
compilation_path = 'tests/benchmarks'
jar_path = 'build/MiniCompiler.jar'
java_path = 'JAVA_PATH'
clang_path = 'CLANG_PATH'


def test_all():
    """
    Runs a comprehensive test of the compiler
    """
    total_fails = 0
    total_fails += test_semantic_analysis()
    total_fails += test_compilation()
    if total_fails == 0:
        logger.info("ALL TESTS PASSED")
    else:
        logger.warning(f"FAILED {total_fails} TESTS")


def benchmark():
    """
    Runs and records timing for all executables using UNIX time
    :return: Number of test fails
    """
    timefile = open('times.txt', 'w+')

    cwd = os.getcwd()
    os.chdir(compilation_path)
    total_fails = 0
    for root, dirs, files in os.walk(".", topdown=False):
        for name in dirs:
            time_program(name, timefile)
    os.chdir(cwd)

    timefile.close()
    return total_fails


def time_program(dir: str, timefile: typing.TextIO):
    logger.info("|\tTiming Files:\n")
    cwd = os.getcwd()
    os.chdir(dir)
    for root, dirs, files in os.walk(".", topdown=False):
        for name in files:
            if name.endswith(".c"):
                subprocess.run(['gcc', '-o', 'out', '-O0', name])
                time_files(name, '-O0', timefile)
                subprocess.run(['gcc', '-o', 'out', '-O3', name])
                time_files(name, '-O3', timefile)
            if name.endswith(".mini"):
                gen_ll(name, "stack", False)
                gen_clang_exec(name, "stack")
                time_files(name, 'LLVM STACK', timefile)
                gen_ll(name, "ssa", False)
                gen_clang_exec(name, "ssa")
                time_files(name, 'LLVM UNOPT SSA', timefile)
                gen_ll(name, "ssa", True)
                gen_clang_exec(name, "ssa")
                time_files(name, 'LLVM OPT SSA', timefile)
                gen_arm(name, "stack", False)
                gen_native_exec(name, "stack")
                time_files(name, 'ARM STACK', timefile)
                gen_arm(name, "ssa", False)
                gen_native_exec(name, "ssa")
                time_files(name, 'ARM UNOPT SSA', timefile)
                gen_arm(name, "ssa", True)
                gen_native_exec(name, "ssa")
                time_files(name, 'ARM OPT SSA', timefile)
    os.chdir(cwd)


def time_files(source_file: str, op_string: str, timefile: typing.TextIO):
    timing_helper(source_file, 'input', op_string, timefile)
    if os.path.isfile('input.longer'):
        timing_helper(source_file, 'input.longer', op_string, timefile)


def timing_helper(source_file: str, input_path: str, op_string: str, timefile: typing.TextIO):
    logger.info(f'\t|\tTiming {source_file} {op_string} with {input_path}')
    timefile.write(f"\n{source_file} {op_string} run with {input_path}:\n")
    for i in range(3):
        with open(input_path, 'r') as infile, open('temp', 'w+') as tempfile:
            subprocess.run(['perf', 'stat', './out'], stdin=infile, stdout=PIPE, stderr=tempfile)

        with open('temp', 'r') as tempfile:
            lines = tempfile.readlines()
            for line in lines:
                timefile.write(line)

    os.remove('temp')


def test_semantic_analysis() -> int:
    """
    Runs semantic analysis tests from milestone 1.
        (Shows that it type checks properly)
    :return: Number of test fails
    """
    cwd = os.getcwd()
    os.chdir(semantics_path)
    total_fails = 0
    for root, dirs, files in os.walk(".", topdown=False):
        for name in files:
            if name.endswith(".mini"):
                logger.info(f'|\tTesting Semantics: {name}')
                total_fails += test_semantics(name)
    os.chdir(cwd)
    return total_fails


def test_semantics(source_name: str) -> int:
    proc = subprocess.run([java_path, '-jar', jar_path, source_name, "-validate"], stdout=PIPE, stderr=PIPE)
    if proc.returncode == 0:
        logger.error('\t\t|\t< semantic analysis failed >')
        return 1
    return 0


def test_compilation() -> int:
    """
    Generates clang and/or arm files and runs against reference output.
    Modify the array with ['arm', 'clang'] if you want to skip testing one or the other.
    :return: Number of test fails
    """
    cwd = os.getcwd()
    os.chdir(compilation_path)
    total_fails = 0
    for root, dirs, files in os.walk(".", topdown=False):
        for name in dirs:
            total_fails += test_compilation_helper(name, ['clang', 'arm'])
    os.chdir(cwd)
    return total_fails


def test_compilation_helper(dir: str, tests: List[str]) -> int:
    cwd = os.getcwd()
    os.chdir(dir)
    num_fails = 0
    for root, dirs, files in os.walk(".", topdown=False):
        for name in files:
            if name.endswith(".mini"):
                if 'clang' in tests:
                    logger.info(f'|\tTesting Stack Based Clang: {name}')
                    num_fails += test_clang(name, 'stack', False)
                    logger.info(f'|\tTesting Unoptimized SSA Based Clang: {name}')
                    num_fails += test_clang(name, 'ssa', False)
                    logger.info(f'|\tTesting Optimized SSA Based Clang: {name}')
                    num_fails += test_clang(name, 'ssa', True)

                if 'arm' in tests:
                    logger.info(f'|\tTesting Stack Based Arm: {name}')
                    num_fails += test_arm(name, 'stack', False)
                    logger.info(f'|\tTesting Unoptimized SSA Based Arm: {name}')
                    num_fails += test_arm(name, 'ssa', False)
                    logger.info(f'|\tTesting Optimized SSA Based Arm: {name}')
                    num_fails += test_arm(name, 'ssa', True)
    os.chdir(cwd)
    return num_fails


def test_clang(source_name: str, form: str, opt: bool) -> int:
    rv = gen_ll(source_name, form, opt)
    if rv == 0:
        rv = gen_clang_exec(source_name, form)
    if rv == 0:
        rv = compare_output('input', 'output.expected')
    if rv == 0 and os.path.isfile('input.longer'):
        rv = compare_output('input.longer', 'output.longer.expected')
    return rv


def test_arm(source_name: str, form: str, opt: bool) -> int:
    rv = gen_arm(source_name, form, opt)
    if rv == 0:
        rv = gen_native_exec(source_name, form)
    if rv == 0:
        rv = compare_output('input', 'output.expected')
    if rv == 0 and os.path.isfile('input.longer'):
        rv = compare_output('input.longer', 'output.longer.expected')
    return rv


def gen_ll(source_name: str, form: str, opt: bool) -> int:
    logger.info(f'\t|\tGenerating .ll file')
    name = source_name[:-5]
    if opt:
        proc = subprocess.run([java_path, '-jar', jar_path, source_name, f'-{form}', '-llvm', f'{name}_{form}.ll'])
    else:
        proc = subprocess.run(
            [java_path, '-jar', jar_path, source_name, '-notrans', f'-{form}', '-llvm', f'{name}_{form}.ll'])

    if proc.returncode != 0:
        logger.error('\t\t|\t< jar failed >')
        return 1
    return 0


def gen_arm(source_name: str, form: str, opt: bool) -> int:
    logger.info(f'\t|\tGenerating .s file')
    name = source_name[:-5]
    if opt:
        proc = subprocess.run([java_path, '-jar', jar_path, source_name, f'-{form}', "-arm", f'{name}_{form}.s'])
    else:
        proc = subprocess.run(
            [java_path, '-jar', jar_path, source_name, '-notrans', f'-{form}', "-arm", f'{name}_{form}.s'])
    if proc.returncode != 0:
        logger.error('\t\t|\t< jar failed >')
        return 1
    return 0


def gen_clang_exec(source_name: str, form: str) -> int:
    logger.info(f'\t|\tGenerating clang executable file')
    name = source_name[:-5]
    proc = subprocess.run([clang_path, '-o', 'out', f'{name}_{form}.ll'], stdout=PIPE, stderr=PIPE)
    if proc.returncode != 0:
        logger.error('\t\t|\t< clang failed >')
        return 1
    return 0


def gen_native_exec(source_name: str, form: str) -> int:
    logger.info(f'\t|\tGenerating native executable file')
    name = source_name[:-5]
    proc = subprocess.run(['gcc', '-o', 'out', f'{name}_{form}.s'])
    if proc.returncode != 0:
        logger.error('\t\t|\t< gcc failed >')
        return 1
    return 0


def compare_output(input_path: str, expected_path: str) -> int:
    logger.info(f'\t|\tRunning with {input_path}')
    outfile = open('temp', 'w+')
    with open(input_path, 'r') as infile:
        proc = subprocess.run(['./out'], stdin=infile, stdout=outfile)
        if proc.returncode != 0:
            logger.error('\t\t|\t< executable failed >')
            return 1
    outfile.close()

    resultfile = open('temp', 'r')
    results = resultfile.read().splitlines()
    with open(expected_path) as expected_file:
        expected = expected_file.read().splitlines()

    for line in difflib.unified_diff(results, expected, 'output', expected_path):
        logger.warning(line)
        return 1

    return 0


test_all()




