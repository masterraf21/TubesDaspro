program Main;

uses 
	Header, UserHandler, FileHandler;

var
	cmd: string;
	running: boolean;

begin
	init;
	loggedIn := false;
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
			load
		else if (cmd = 'save') then
			save
		else if (cmd = 'cari_anggota') then
			// cari_anggota
		else if (cmd = 'help') then
			// help
		else if (cmd = 'exit') then begin
			write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');
			readln(cmd);
			if (cmd = 'Y') or (cmd = 'N') then begin
				if (cmd = 'Y') then
					save;
				running := false;
			end;
		end else if (cmd = 'debug') then begin
			writeln(length(userData), ', ', userData[0].username);
		end;
	end;
end.