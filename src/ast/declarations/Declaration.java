package ast.declarations;

import ast.types.Type;

import java.util.Objects;

public class Declaration {
    private final int lineNum;
    private final Type type;
    private final String name;

    public Declaration(int lineNum, Type type, String name) {
        this.lineNum = lineNum;
        this.type = type;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public Type getType() {
        return type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Declaration that = (Declaration) o;
        return Objects.equals(type, that.type) && Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(type, name);
    }

}
