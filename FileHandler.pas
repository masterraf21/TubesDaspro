unit FileHandler;

interface
	uses
		Header, Sysutils;
	procedure save;
	procedure load;

implementation
	type
		Table = array of array of string;
	const
		parentFile = 'output';
		bukuCol = 6;
		userCol = 5;
		pinjamCol = 5;
		kembaliCol = 3;
		hilangCol = 3;

	var
		namaFileBuku, namaFileUser, namaFilePinjam, namaFileKembali, namaFileHilang: string;
		fileBuku, fileUser, filePinjam, fileKembali, fileHilang: TextFile;
		u: User;
		b: Buku;
		p: PinjamHistory;
		k: KembaliHistory;
		h: LaporanHilang;

	procedure inputFiles;
		begin
			write('Masukkan nama File Buku: ');
			readln(namaFileBuku);
			assign(fileBuku, namaFileBuku + '.csv');
			write('Masukkan nama File User: ');
			readln(namaFileUser);
			assign(fileUser, namaFileUser + '.csv');
			write('Masukkan nama File Peminjaman: ');
			readln(namaFilePinjam);
			assign(filePinjam, namaFilePinjam + '.csv');
			write('Masukkan nama File Pengembalian: ');
			readln(namaFileKembali);
			assign(fileKembali, namaFileKembali + '.csv');
			write('Masukkan nama File Buku Hilang: ');
			readln(namaFileHilang);
			assign(fileHilang, namaFileHilang + '.csv');
		end;
	procedure save;
		var
			i: integer;
			res: string;
		begin
			inputFiles;

			rewrite(fileBuku);
			write(fileBuku, 'ID_Buku,Judul_Buku,Author,Jumlah_Buku,Tahun_Penerbit,Kategori');
			for i := 0 to length(bukuData)-1 do begin
				b := bukuData[i];
				write(fileBuku, br, b.id, ',', b.judul, ',', b.author, ',', b.jumlah, ',', b.tahun, ',', b.kategori);
			end;
			close(fileBuku);

			rewrite(fileUser);
			write(fileUser, 'Nama,Alamat,Username,Password,Role');
			for i := 0 to length(userData)-1 do begin
				u := userData[i];
				write(fileUser, br, u.nama, ',', u.alamat, ',', u.username, ',', u.password, ',', u.role);
			end;
			close(fileUser);

			rewrite(filePinjam);
			write(filePinjam, 'Username,ID_Buku,Tanggal_Peminjaman,Tanggal_Batas_Pengembalian,Status_Pengembalian');
			for i := 0 to length(pinjamData)-1 do begin
				p := pinjamData[i];
				write(filePinjam, br, p.username, ',', p.id, ',', tanggalToString(p.tanggalPinjam), ',', tanggalToString(p.tanggalKembali), ',', p.status);
			end;
			close(filePinjam);

			rewrite(fileKembali);
			write(fileKembali, 'Username,ID_Buku,Tanggal_Pengembalian');
			for i := 0 to length(kembaliData)-1 do begin
				k := kembaliData[i];
				write(fileKembali, br, k.username, ',', k.id, ',', tanggalToString(k.tanggal));
			end;
			close(fileKembali);

			rewrite(fileHilang);
			write(fileHilang, 'Username,ID_Buku_Hilang,Tanggal_Laporan');
			for i := 0 to length(laporanHilangData)-1 do begin
				h := laporanHilangData[i];
				write(fileHilang, br, h.username, ',', h.id, ',', tanggalToString(h.tanggal));
			end;
			close(fileHilang);

			writeln('Data berhasil disimpan!');
		end;
	function readData(var data: TextFile; col: integer): Table;
		var
			doneFirst: boolean;
			line, read: string;
			i, j, index: integer;
			res: Table;
		begin
			setLength(res, 32767, col);
			reset(data);
			doneFirst := false;
			read := '';
			index := 0;
			while not eof(data) do begin
				readln(data, line);
				j := 0;
				if (doneFirst) then begin
					for i := 1 to length(line) do begin
						if (line[i] <> ',') and (i < length(line)) then begin
							read := read + line[i];
						end else begin
							if (i = length(line)) then
								read := read + line[i];
							res[index][j] := read;
							j := j + 1;
							read := '';
						end;
					end;
					index := index + 1;
				end;
				doneFirst := true;
			end;
			setLength(res, index, col);
			readData := res;
		end;
	procedure load;
		var
			arr: array of array of string;
			i: integer;
		begin
			inputFiles;

			arr := readData(fileBuku, bukuCol);
			for i := 0 to length(arr)-1-1 do begin
				b.id := StrToInt(arr[i][0]);
				b.judul := arr[i][1];
				b.author := arr[i][2];
				b.jumlah := StrToInt(arr[i][3]);
				b.tahun := StrToInt(arr[i][4]);
				b.kategori := arr[i][5];
				addBuku(b);
			end;

			arr := readData(fileUser, userCol);
			for i := 0 to length(arr)-1 do begin
				u.nama := arr[i][0];
				u.alamat := arr[i][1];
				u.username := arr[i][2];
				u.password := arr[i][3];
				u.role := arr[i][4];
				addUser(u);
			end;

			arr := readData(filePinjam, pinjamCol);
			for i := 0 to length(arr)-1 do begin
				p.username := arr[i][0];
				p.id := StrToInt(arr[i][1]);
				p.tanggalPinjam := getTanggal(arr[i][2]);
				p.tanggalKembali := getTanggal(arr[i][3]);
				p.status := lowerCase(arr[i][4]) = 'true';
				addPinjam(p);
			end;

			arr := readData(fileKembali, kembaliCol);
			for i := 0 to length(arr)-1 do begin
				k.username := arr[i][0];
				k.id := StrToInt(arr[i][1]);
				k.tanggal := getTanggal(arr[i][2]);
				addKembali(k);
			end;

			arr := readData(fileHilang, hilangCol);
			for i := 0 to length(arr)-1 do begin
				h.username := arr[i][0];
				h.id := StrToInt(arr[i][1]);
				h.tanggal := getTanggal(arr[i][2]);
				addHilang(h);
			end;

			writeln('File perpustakaan berhasil dimuat!');
		end;

end.