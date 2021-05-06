package MainBean;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
	@Column(name="DiemHD")
	private Float diemHD;
	@Column(name="DiemPB")
	private Float diemPB;
	@Column(name="DiemTB")
	private Float diemTB;
	@Column(name="DiemTong")
	private Float diemTong;
	@ManyToOne
	@JoinColumn(name="MaTB")
	private TieuBan tieuBan;
	@OneToOne(mappedBy = "doAn", fetch=FetchType.EAGER)
	private SinhVien sinhVien;
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
	public Float getDiemHD() {
		return diemHD;
	}
	public void setDiemHD(Float diemHD) {
		this.diemHD = diemHD;
	}
	public Float getDiemPB() {
		return diemPB;
	}
	public void setDiemPB(Float diemPB) {
		this.diemPB = diemPB;
	}
	public Float getDiemTB() {
		return diemTB;
	}
	public void setDiemTB(Float diemTB) {
		this.diemTB = diemTB;
	}
	public Float getDiemTong() {
		return diemTong;
	}
	public void setDiemTong(Float diemTong) {
		this.diemTong = diemTong;
	}
	public TieuBan getTieuBan() {
		return tieuBan;
	}
	public void setTieuBan(TieuBan tieuBan) {
		this.tieuBan = tieuBan;
	}
	public SinhVien getSinhVien() {
		return sinhVien;
	}
	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}
	public DoAn(int maDA, String tenDA, String chiTiet, GiangVien gVHD, GiangVien gVPB, Float diemHD, Float diemPB,
			Float diemTB, Float diemTong, TieuBan tieuBan, SinhVien sinhVien) {
		super();
		this.maDA = maDA;
		this.tenDA = tenDA;
		this.chiTiet = chiTiet;
		GVHD = gVHD;
		GVPB = gVPB;
		this.diemHD = diemHD;
		this.diemPB = diemPB;
		this.diemTB = diemTB;
		this.diemTong = diemTong;
		this.tieuBan = tieuBan;
		this.sinhVien = sinhVien;
	}
	public DoAn() {
		super();
	}
	
	
	
	
	
}
