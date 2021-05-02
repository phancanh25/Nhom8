package MainBean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="GiangVien")
public class GiangVien {
	@Id
	@Column(name="MaGV")
	private String maGV;
	
	@Column(name="Ho")
	private String ho;
	
	@Column(name="Ten")
	private String ten;
	
	@Column(name="Phai")
	private boolean phai;
	
	@Column(name="SDT")
	private String SDT;
	
	@Column(name="DiaChi")
	private String diaChi;

	public GiangVien() {
		super();
	}

	public GiangVien(String maGV, String ho, String ten, boolean phai, String sDT, String diaChi) {
		super();
		this.maGV = maGV;
		this.ho = ho;
		this.ten = ten;
		this.phai = phai;
		SDT = sDT;
		this.diaChi = diaChi;
	}

	public String getMaGV() {
		return maGV;
	}

	public void setMaGV(String maGV) {
		this.maGV = maGV;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public boolean isPhai() {
		return phai;
	}

	public void setPhai(boolean phai) {
		this.phai = phai;
	}

	public String getSDT() {
		return SDT;
	}

	public void setSDT(String sDT) {
		SDT = sDT;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	
	
}
