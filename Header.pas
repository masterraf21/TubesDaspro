unit Header;

interface
	uses
		Classes, Sysutils;

	type
		Tanggal = record
			d, m, y: integer;
		end;
		User = record
			nama, alamat, username, password, role: string;
		end;
		Buku = record
			id, jumlah, tahun: integer;
			judul, author, kategori: string;
		end;
		PinjamHistory = record
			username: string;
			id: integer;
			status: boolean;
			tanggalPinjam, tanggalBalik: Tanggal;
		end;
		KembaliHistory = record
			username: string;
			id: integer;
			tanggal: Tanggal;
		end;
		LaporanHilang = record
			username: string;
			id: integer;
			tanggal: Tanggal;
		end;

	var
		loggedUser: User;
		loggedIn: boolean;
		userData, pinjamHistoryData, kembaliHistoryData, laporanHilangData: TList;

	procedure init;
	function getUser(i: integer): User;
	procedure addUser(u: user);

implementation
	procedure init;
		begin
			userData := TList.create;
			pinjamHistoryData := TList.create;
			kembaliHistoryData := TList.create;
			laporanHilangData := TList.create;
		end;
	function getUser(i: integer): User;
		begin
			getUser := User((userData[i])^);
		end;
	procedure addUser(u: user);
		begin
			userData.add(@u);
		end;
end.