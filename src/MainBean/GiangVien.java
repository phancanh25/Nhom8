package MainBean;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
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
	
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "ChiTietTieuBan",
            joinColumns = @JoinColumn(name = "MaGV"),
            inverseJoinColumns = @JoinColumn(name = "MaTB")
    )
    private List<TieuBan> tieuBans;

	public GiangVien(String maGV, String ho, String ten, boolean phai, String sDT, String diaChi,
			List<TieuBan> tieuBans) {
		super();
		this.maGV = maGV;
		this.ho = ho;
		this.ten = ten;
		this.phai = phai;
		SDT = sDT;
		this.diaChi = diaChi;
		this.tieuBans = tieuBans;
	}

	public GiangVien() {
		super();
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

	public List<TieuBan> getTieuBans() {
		return tieuBans;
	}

	public void setTieuBans(List<TieuBan> tieuBans) {
		this.tieuBans = tieuBans;
	}

	
}
