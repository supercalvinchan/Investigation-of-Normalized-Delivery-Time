    %Define no. of servers
    S = 10


    %Define \rho
    rho = 4

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
