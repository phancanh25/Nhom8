package MainBean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="DoAn")
public class DoAn {
	@Id
	@Column(name="MaDA")
	private int maDA;
	
	@Column(name="TenDA")
	private String tenDA;
	
	@Column(name="ChiTiet")
	private String chiTiet;
	
	@ManyToOne
	@JoinColumn(name="MaGVHD")
	private GiangVien GVHD;
	
	@ManyToOne
	@JoinColumn(name="MaGVPB")
	private GiangVien GVPB;

	public DoAn() {
		super();
	}

	public DoAn(int maDA, String tenDA, String chiTiet, GiangVien gVHD, GiangVien gVPB) {
		super();
		this.maDA = maDA;
		this.tenDA = tenDA;
		this.chiTiet = chiTiet;
		GVHD = gVHD;
		GVPB = gVPB;
	}

	public int getMaDA() {
		return maDA;
	}

	public void setMaDA(int maDA) {
		this.maDA = maDA;
	}

	public String getTenDA() {
		return tenDA;
	}

	public void setTenDA(String tenDA) {
		this.tenDA = tenDA;
	}

	public String getChiTiet() {
		return chiTiet;
	}

	public void setChiTiet(String chiTiet) {
		this.chiTiet = chiTiet;
	}

	public GiangVien getGVHD() {
		return GVHD;
	}

	public void setGVHD(GiangVien gVHD) {
		GVHD = gVHD;
	}

	public GiangVien getGVPB() {
		return GVPB;
	}

	public void setGVPB(GiangVien gVPB) {
		GVPB = gVPB;
	}

	
	
}
