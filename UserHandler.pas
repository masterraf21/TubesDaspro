unit UserHandler;

interface
	uses 
		Header;
	procedure login;
	procedure register;
	procedure cari_anggota;

implementation
	procedure login;
		var
			username, password: string;
			i: integer;
			valid: boolean;
			u: User;
		begin
			valid := false;
			write('Masukkan username: ');
			readln(username);
			write('Masukkan password: ');
			readln(password);
			valid := false;
			for i := 0 to length(userData)-1 do begin
				u := userData[i];
				if username = u.username then begin
					if hashCode(password) = u.password then
						valid := true;
					break;
				end;
			end;
			if valid then begin
				writeln('Selamat datang ', u.username, '!');
				loggedUser := u;
				loggedIn := true;
			end else
				writeln('Username / password salah! Silakan coba lagi.');
		end;
		
	procedure register;
		var 
			nama, alamat, username, password: string;
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
			readln(password);
			res.password := hashCode(password);
			res.role := 'Pengunjung';
			writeln;
			addUser(res);
			writeln('Pengunjung ', nama, ' berhasil terdaftar sebagai user.');
		end;

	procedure cari_anggota;
		{
			prosedur untuk mencari anggota dari database;
		}
		var
			username : string; //username yang ingin dicari
			i : integer;


		begin
			//read input
			write('Masukkan username: ');
			readln(username);

			//search di array database userData
			for i:=0 to length(userData)-1 do
			begin
			 	if(username = userData[i].username) then
			 	begin
			 		writeln('Nama Angota: ', userData[i].username);
			 		writeln('Alamat Anggota: ', userData[i].alamat);
			 		break;
			 	end else if(i=length(userData)-1)and(username<>userData[i].username) then
			 	begin
			 		writeln('Pencarian anggota tidak ditemukan');
			 	end;
			end; 

		end;
end.