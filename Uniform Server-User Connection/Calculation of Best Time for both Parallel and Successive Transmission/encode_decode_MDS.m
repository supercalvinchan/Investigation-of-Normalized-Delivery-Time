m = 3;                   % Number of bits per symbol
n = 2^m-1;               % Codeword length
k = 3;                   % Message length
msg = gf([2 7 3; 4 0 6; 5 1 1],m);
%Encode
code = rsenc(msg,n,k);

%Introducing Errors
errors = gf([2 0 0 0 0 0 0; 3 4 0 0 0 0 0; 5 6 7 0 0 0 0],m);
noisycode = code + errors;

%Decode
[rxcode,cnumerr] = rsdec(noisycode,n,k);