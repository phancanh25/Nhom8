package MainBean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="AccountGV")
public class AccountGV {
	@Id
	@Column(name="Username")
	private String username;
	
	@Column(name="Password")
	private String password;
	
	@ManyToOne
	@JoinColumn(name="MaRole")
	private Role role;
	
	@ManyToOne
	@JoinColumn(name="MaGV")
	private GiangVien giangVien;

	@Column(name="email")
	private String email;
	
	@Column(name="token")
	private String token;
	
	public AccountGV() {
		super();
	}

	public AccountGV(String username, String password, Role role, GiangVien giangVien, String email, String token) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
		this.giangVien = giangVien;
		this.email = email;
		this.token = token;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public GiangVien getGiangVien() {
		return giangVien;
	}

	public void setGiangVien(GiangVien giangVien) {
		this.giangVien = giangVien;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	
	
}
