package ast.expressions;

import ast.*;
import ast.types.*;
import instructions.*;
import instructions.llvm.AllocaLLVMInstruction;
import instructions.llvm.BitcastLLVMInstruction;

public class NewArrayExpression
    extends AbstractExpression
{
    private final String size;

    public NewArrayExpression(int lineNum, String size)
    {
        super(lineNum);
        this.size = size;
    }

    @Override
    public Type typecheck(TypeEnvironment env) throws TypeException {
        try {
            int sizeVal = Integer.parseInt(size);
            if (sizeVal <= 0) {
                throw new TypeException(String.format("NewArrayExpression: Size Must Be" +
                        "Non-Negative, not %d, line %d", sizeVal, getLineNum()));
            }
        } catch (NumberFormatException e) {
            throw new TypeException(String.format("NewArrayExpression: Invalid Size" +
                    "Parameter Type %s, line %d", size, getLineNum()));
        }
        return new ArrayType();
    }

    @Override
    public Source toStackInstructions(BasicBlock block, IrFunction func) {
        return evalNewArray(block, func);
    }

    @Override
    public Source toSSAInstructions(BasicBlock block, IrFunction func) {
        return evalNewArray(block, func);
    }

    private Source evalNewArray(BasicBlock block, IrFunction func) {
        // define next regs
        Register allocaResult = Register.genTypedLocalRegister(new PointerType(new ArrayAllocType(size)), block.getLabel());
        Register castResult = Register.genTypedLocalRegister(new ArrayType(), block.getLabel());

        //define instruction strings
        AllocaLLVMInstruction alloca = new AllocaLLVMInstruction(allocaResult);
        BitcastLLVMInstruction bitcast = new BitcastLLVMInstruction(castResult, allocaResult);

        //add instruction strings to basic block
        block.addCode(alloca);
        block.addCode(bitcast);

        //return value that represents array
        return castResult;
    }
}
