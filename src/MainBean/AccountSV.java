package MainBean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="AccountSV")
public class AccountSV {
	@Id
	@Column(name="Username")
	private String username;
	
	@Column(name="Password")
	private String password;
	
	@ManyToOne
	@JoinColumn(name="MaRole")
	private Role role;
	
	@ManyToOne
	@JoinColumn(name="MaSV")
	private SinhVien sinhVien;

	public AccountSV() {
		super();
	}

	public AccountSV(String username, String password, Role role, SinhVien sinhVien) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
		this.sinhVien = sinhVien;
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

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}
	
}
