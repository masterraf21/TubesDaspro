unit FileHandler;

interface
	uses
		Header, Sysutils;
	procedure save;
	procedure load;

implementation
	const
		parentFile = 'output';
	var
		namaFileBuku, namaFileUser, namaFilePinjam, namaFileKembali, namaFileHilang: string;
		fileBuku, fileUser, filePinjam, fileKembali, fileHilang: TextFile;
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
			u: User;
			res: string;
		begin
			inputFiles;
			rewrite(fileUser);
			write(fileUser, 'Nama,Alamat,Username,Password,Role');
			for i := 0 to length(userData)-1 do begin
				u := userData[i];
				write(fileUser, br, u.nama, ',', u.alamat, ',', u.username, ',', u.password, ',', u.role);
			end;
			close(fileUser);
			writeln('Data berhasil disimpan!');
		end;

	procedure load;
		begin
			inputFiles;
			
			writeln('File perpustakaan berhasil dimuat!');
		end;

end.