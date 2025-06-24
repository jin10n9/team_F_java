package model;

/**
 * Represents a user in the system, matching the public.user table structure.
 */
public class User {
    private int userId;            // maps to user_id column
    private String name;           // maps to name column
    private String email;          // maps to email column
    private String passwordHash;   // maps to password_hash column
    private String role;           // maps to role column

    /** No-argument constructor for frameworks and bean usage. */
    public User() {}

    /** Full-argument constructor. */
    public User(int userId, String name, String email, String passwordHash, String role) {
        this.userId       = userId;
        this.name         = name;
        this.email        = email;
        this.passwordHash = passwordHash;
        this.role         = role;
    }

    // Getters and setters
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }
    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }
}
