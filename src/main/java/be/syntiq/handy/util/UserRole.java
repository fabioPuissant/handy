package be.syntiq.handy.util;

public enum UserRole {
    ADMIN("ADMIN"), JOB_POSTER("JOB_POSTER"), HANDY("HANDY");

    private String roleName;

    UserRole(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleName() {
        return roleName;
    }
}
