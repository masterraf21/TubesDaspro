unit UserHandler;

interface
	uses 
		Header;
	procedure login;
	procedure register;

implementation
	procedure login;
		var
			username, password: string;
			i: integer;
			valid: boolean;
			u: User;
		begin
			write('Masukkan username: ');
			readln(username);
			write('Masukkan password: ');
			readln(password);
			valid := false;
			for i := 0 to userData.count-1 do begin
				u := getUser(i);
				if username = u.username then begin
					writeln(u.username);
					if password = u.password then
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
			res.password := password;
			writeln;
			addUser(res);
			writeln('Pengunjung ', nama, ' berhasil terdaftar sebagai user.');
		end;
end.