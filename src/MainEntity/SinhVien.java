package MainEntity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="SinhVien")

public class SinhVien {
	@Id
	@Column(name="MaSV")
	private String maSV;
	@Column(name="Ho")
	private String ho;
	@Column(name="Ten")
	private String ten;
	@Column(name="Lop")
	private String lop;
	
	  @Temporal(TemporalType.DATE)
	  
	  @DateTimeFormat(pattern="yyyy/MM/dd")
	 
	
	
	private Date ngaySinh;
	@Column(name="Phai")
	private String phai;
	@Column(name="DiaChi")
	private String diaChi;
	@Column(name="Khoa")
	private int khoa;
	@Column(name="MaDA")
	private int maDA;
	@Column(name="DiemTBTL")
	private float diemTBTL;
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
	public String getPhai() {
		return phai;
	}
	public void setPhai(String phai) {
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
	public int getMaDA() {
		return maDA;
	}
	public void setMaDA(int maDA) {
		this.maDA = maDA;
	}
	public float getDiemTBTL() {
		return diemTBTL;
	}
	public void setDiemTBTL(float diemTBTL) {
		this.diemTBTL = diemTBTL;
	}
	
	
	
	

}
