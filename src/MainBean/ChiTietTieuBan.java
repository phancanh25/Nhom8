//package MainBean;
//
//import java.util.List;
//
//import javax.persistence.Column;
//import javax.persistence.EmbeddedId;
//import javax.persistence.Entity;
//
//import javax.persistence.JoinColumn;
//
//import javax.persistence.ManyToOne;
//import javax.persistence.MapsId;
//import javax.persistence.Table;
//
//
//
//
//@Entity
//@Table(name="ChiTietTieuBan")
//public class ChiTietTieuBan {
//	
//	@EmbeddedId
//	
//	@ManyToOne
//	@MapsId("maGV")
//	@JoinColumn(name="MaGV")
//	GiangVien giangVien;
//	
//	@ManyToOne
//	@MapsId("maTB")
//	@JoinColumn(name="MaTB")
//	TieuBan tieuBan;
//	
//	@Column(name="ChiTiet")
//	private String chiTiet;
//
//
//	public ChiTietTieuBan(GiangVien giangVien, TieuBan tieuBan, String chiTiet) {
//		super();
//		this.giangVien = giangVien;
//		this.tieuBan = tieuBan;
//		this.chiTiet = chiTiet;
//	}
//
//	public ChiTietTieuBan() {
//		super();
//	}
//
//	public GiangVien getGiangVien() {
//		return giangVien;
//	}
//
//	public void setGiangVien(GiangVien giangVien) {
//		this.giangVien = giangVien;
//	}
//
//	public TieuBan getTieuBan() {
//		return tieuBan;
//	}
//
//	public void setTieuBan(TieuBan tieuBan) {
//		this.tieuBan = tieuBan;
//	}
//
//	public String getChiTiet() {
//		return chiTiet;
//	}
//
//	public void setChiTiet(String chiTiet) {
//		this.chiTiet = chiTiet;
//	}
//
//}
