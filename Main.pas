Program prog;
type 
	Tanggal = record
		d, m, y: integer;
	end;
	Buku = record
		id, jumlah, tahun: integer;
		judul, author, kategori: string;
	end;
	User = record
		nama, alamat, username, pass, role: string;
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
	NMax = 100000;
var
	cmd: string;
	running: boolean;
	bukuData: array [1..NMax] of Buku;
	userData: array [1..NMax] of User;
	pinjamHistoryData: array [1..NMax] of PinjamHistory;
	kembaliHistoryData: array [1..NMax] of KembaliHistory;
	laporanHilangData: array [1..NMax] of LaporanHilang;
	bukuCnt, userCnt, pinjamCnt, kembaliCnt, laporanCnt: integer;
// procedure addToArray(var arr: array of object; v: object);
// 	begin
// 		setLength(arr, length(arr) + 1);
// 		arr[high(arr)] := v;
// 	end;
procedure addUser(user: User);
// procedure addUser(var arr: array of const; v: const; var cnt: integer);
	begin
		userCnt := userCnt + 1;
		userData[userCnt] := user;
		// cnt := cnt + 1;
		// arr[cnt] := v;
	end;
procedure register;
	var 
		nama, alamat, username, pass: string;
		res: User;
	begin
		write('Masukkan nama pengunjung: ');
		readln(nama);
		res.nama := nama;
		write('Masukkan alamat pengunjung: ');
		readln(alamat);
		res.alamat := alamat;
		write('Masukkan username pengunjung: ');
		readln(username);
		res.username := username;
		write('Masukkan password pengunjung: ');
		readln(pass);
		res.pass := pass;
		writeln;
		addUser(res);
		writeln('Pengunjung ', nama, ' berhasil terdaftar sebagai user.');
		// writeln('LOG: ', userCnt, ' ', userData[2].username);
	end;

procedure login;
	begin

	end;

begin
	running := true;
	while running do begin
		readln(cmd);
		if (cmd = 'register') then
			register
		else if (cmd = 'login') then
			login
		else if (cmd = 'cari') then
			// cari
		else if (cmd = 'caritahunterbit') then
			// caritahunterbit
		else if (cmd = 'pinjam_buku') then
			// pinjam_buku
		else if (cmd = 'kembalikan_buku') then
			// kembalikan_buku
		else if (cmd = 'lapor_hilang') then
			// lapor_hilang
		else if (cmd = 'lihat_laporan') then
			// lihat_laporan
		else if (cmd = 'tambah_buku') then
			// tambah_buku
		else if (cmd = 'tambah_jumlah_buku') then
			// tambah_jumlah_buku
		else if (cmd = 'riwayat') then
			// riwayat
		else if (cmd = 'statistik') then
			// statistik
		else if (cmd = 'load') then
			// load
		else if (cmd = 'save') then
			// save
		else if (cmd = 'cari_anggota') then
			// cari_anggota
		else if (cmd = 'exit') then begin
			// write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');
			// readln(cmd);
			// if (cmd = 'Y') or (cmd = 'N') then begin
			// 	if (cmd = 'Y') then
			// 		save;
			// 	running := false;
			// end;
		end;
	end;
end.