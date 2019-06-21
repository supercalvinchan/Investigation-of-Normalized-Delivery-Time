%Final normalized delivery time
T_ALL = 0

%counter
loop = 0


    %Define no. of servers
    S = 20


    %Define \rho
    rho = 16

    %define no. of users U
    U = 5

    %Define user storage space
    userstorage = 1

    %Define no. of files
    N = 5

    %Define t
    t = (U * userstorage)/N

    %create 9 servers
    v = [1:1:S]

    %choose 6 server each time; \rho = 6
    C = nchoosek(v,rho)

    %there are P choose \rho rows
    b = nchoosek(S,rho)

    %Initialize server-user connecting matrix
    c_matrix = zeros(S,U)

    %looping for U times
    for j = 1 : U

    %choose entry index randomly with UNIFORM PROBABILITY
    r = randi([1 b], 1, 1);

    %extracting the connecting servers
    extract = C(r,:);

    %create connection; 1 means connected; 0 means no connection
        for idx = 1:numel(extract)
            element = extract(idx);
            c_matrix(element,j) = 1;
        end
    end
    
      D = nchoosek(U,t)
      
       AT = nchoosek(S, rho)^(U)
      
      Part1 = (S/rho)*((U-t)/(t+1))
      
      coef = S/((rho*D)*AT)
      
      syms i
      
      var = nchoosek(U - i,t+1)
      
      f_coef =  symsum(var, i, 0, U)
      
      
      syms j
      
       var_1 = nchoosek(U,j) 
      
       var_2 = nchoosek(S-1, rho-1)^(j)
      
       var_3 = nchoosek(S-1, rho)^(U-j)
        
        N = (var_1)*(var_2)*(var_3)
        
       
        
        h_coef = symsum(N, j, 0, U)
        
        h_temp = h_coef * coef
      
      
      % W = nchoosek(U - q, t+1)
   
      %s_no = nchoosek(S, rho)^(U)
      %Total = (var_1)*(var_2)*(var_3)
      %var_4 = Total/s_no
      %var_5 = (var_4)*W
      %syms q
      %S1 = symsum(var_5, q ,0,U)
     
      %Part2 = symsum(var_5, q ,0,U)
      %Part2 = (S/(rho*D))*S1
      
      % T = Part1 - Part2
    
      
      
      
    
    
    
      
    