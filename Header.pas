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
			tanggalPinjam, tanggalKembali: Tanggal;
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
		bukuData: array of Buku;
		userData: array of User;
		pinjamData: array of PinjamHistory;
		kembaliData: array of KembaliHistory;
		laporanHilangData: array of LaporanHilang;

	procedure init;
	procedure addBuku(u: Buku);
	procedure addUser(u: User);
	procedure addPinjam(u: PinjamHistory);
	procedure addKembali(u: KembaliHistory);
	procedure addHilang(u: LaporanHilang);
	function getTanggal(s: string): Tanggal;
	function tanggalToString(t: Tanggal): string;

implementation
	procedure init;
		begin
		end;
	procedure addBuku(u: Buku);
		begin
			setLength(bukuData, length(bukuData)+1);
			bukuData[length(bukuData)-1] := u;
		end;
	procedure addUser(u: User);
		begin
			setLength(userData, length(userData)+1);
			userData[length(userData)-1] := u;
		end;
	procedure addPinjam(u: PinjamHistory);
		begin
			setLength(pinjamData, length(pinjamData)+1);
			pinjamData[length(pinjamData)-1] := u;
		end;
	procedure addKembali(u: KembaliHistory);
		begin
			setLength(kembaliData, length(kembaliData)+1);
			kembaliData[length(kembaliData)-1] := u;
		end;
	procedure addHilang(u: LaporanHilang);
		begin
			setLength(laporanHilangData, length(laporanHilangData)+1);
			laporanHilangData[length(laporanHilangData)-1] := u;
		end;
	function getTanggal(s: string): Tanggal;
		var
			res: Tanggal;
			read: string;
			i: integer;
		begin
			i := 1;
			read := '';
			while (s[i] <> '/') do begin
				read := read + s[i];
				i := i + 1;
			end;
			res.d := StrToInt(read);
			read := '';
			i := i + 1;
			while (s[i] <> '/') do begin
				read := read + s[i];
				i := i + 1;
			end;
			res.m := StrToInt(read);
			read := '';
			i := i + 1;
			while (s[i] <> '/') do begin
				read := read + s[i];
				i := i + 1;
			end;
			res.y := StrToInt(read);
			getTanggal := res;
		end;

	function tanggalToString(t: Tanggal): string;
		begin
			tanggalToString := IntToStr(t.d) + '/' + IntToStr(t.m) + '/' + IntToStr(t.y);
		end;
end.