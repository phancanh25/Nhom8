package MainBean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="TieuBan")
public class TieuBan {
	@Id
	@Column(name="MaTB")
	private int maTB;
	
	@Column(name="TenTB")
	private String tenTB;
	
	@Column(name="ChuyenNganh")
	private String chuyenNganh;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name="Ngay")
	private Date ngay;
	
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern="hh:mm:ss")
	@Column(name="Gio")
	private Date gio;
	
	@Column(name="DiaDiem")
	private String diaDiem;
	
	@Column(name="Khoa")
	private int khoa;

	public TieuBan() {
		super();
	}

	public TieuBan(int maTB, String tenTB, String chuyenNganh, Date ngay, Date gio, String diaDiem, int khoa) {
		super();
		this.maTB = maTB;
		this.tenTB = tenTB;
		this.chuyenNganh = chuyenNganh;
		this.ngay = ngay;
		this.gio = gio;
		this.diaDiem = diaDiem;
		this.khoa = khoa;
	}

	public int getMaTB() {
		return maTB;
	}

	public void setMaTB(int maTB) {
		this.maTB = maTB;
	}

	public String getTenTB() {
		return tenTB;
	}

	public void setTenTB(String tenTB) {
		this.tenTB = tenTB;
	}

	public String getChuyenNganh() {
		return chuyenNganh;
	}

	public void setChuyenNganh(String chuyenNganh) {
		this.chuyenNganh = chuyenNganh;
	}

	public Date getNgay() {
		return ngay;
	}

	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}

	public Date getGio() {
		return gio;
	}

	public void setGio(Date gio) {
		this.gio = gio;
	}

	public String getDiaDiem() {
		return diaDiem;
	}

	public void setDiaDiem(String diaDiem) {
		this.diaDiem = diaDiem;
	}

	public int getKhoa() {
		return khoa;
	}

	public void setKhoa(int khoa) {
		this.khoa = khoa;
	}
	
}
