package MainBean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Role")
public class Role {
	@Id
	@Column(name="MaRole")
	private int maRole;
	
	
	@Column(name="TenRole")
	private String tenRole;

	public Role() {
		super();
	}
	
	public Role(int maRole, String tenRole) {
		super();
		this.maRole = maRole;
		this.tenRole = tenRole;
	}

	public int getMaRole() {
		return maRole;
	}


	public void setMaRole(int maRole) {
		this.maRole = maRole;
	}


	public String getTenRole() {
		return tenRole;
	}


	public void setTenRole(String tenRole) {
		this.tenRole = tenRole;
	}
	
	
}
