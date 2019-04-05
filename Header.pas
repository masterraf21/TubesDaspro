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

	const
		br = {$IFDEF LINUX} AnsiChar(#10) {$ENDIF} 
			 {$IFDEF MSWINDOWS} AnsiString(#13#10) {$ENDIF};

	var
		loggedUser: User;
		loggedIn: boolean;
		userData: array of User;
		pinjamHistoryData: array of PinjamHistory;
		kembaliHistoryData: array of KembaliHistory;
		laporanHilangData: array of LaporanHilang;

	procedure init;
	procedure addUser(u: user);

implementation
	procedure init;
		begin
		end;
	procedure addUser(u: user);
		begin
			setLength(userData, length(userData)+1);
			userData[length(userData)-1] := u;
		end;
end.