package MainBean;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="SinhVien")
public class SinhVien {
	@Id
	@Column(name="MASV")
	private String maSV;
	
	@Column(name="Ho")
	private String ho;
	
	@Column(name="Ten")
	private String ten;
	
	@Column(name="Lop")
	private String lop;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name="NgaySinh")
	private Date ngaySinh;
	
	@Column(name="Phai")
	private boolean phai;
	
	@Column(name="DiaChi")
	private String diaChi;
	
	@Column(name="Khoa")
	private int khoa;
	
	@Column(name="DiemTBTL")
	private float diemTBTL;
	
	@OneToOne
	@JoinColumn(name="MaDA", referencedColumnName = "maDA")
	private DoAn doAn;

	public SinhVien() {
		super();
	}

	public SinhVien(String maSV, String ho, String ten, String lop, Date ngaySinh, boolean phai, String diaChi,
			int khoa, float diemTBTL, DoAn doAn) {
		super();
		this.maSV = maSV;
		this.ho = ho;
		this.ten = ten;
		this.lop = lop;
		this.ngaySinh = ngaySinh;
		this.phai = phai;
		this.diaChi = diaChi;
		this.khoa = khoa;
		this.diemTBTL = diemTBTL;
		this.doAn = doAn;
	}



	public String getMaSV() {
		return maSV;
	}

	public void setMaSV(String maSV) {
		this.maSV = maSV;
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

	public String getLop() {
		return lop;
	}

	public void setLop(String lop) {
		this.lop = lop;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public boolean isPhai() {
		return phai;
	}

	public void setPhai(boolean phai) {
		this.phai = phai;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public int getKhoa() {
		return khoa;
	}

	public void setKhoa(int khoa) {
		this.khoa = khoa;
	}

	public float getDiemTBTL() {
		return diemTBTL;
	}

	public void setDiemTBTL(float diemTBTL) {
		this.diemTBTL = diemTBTL;
	}

	public DoAn getDoAn() {
		return doAn;
	}

	public void setDoAn(DoAn doAn) {
		this.doAn = doAn;
	}

	
}
