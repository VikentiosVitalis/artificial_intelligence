directed_by(X, Y) :- director(Y, X). 
find_all_genres(M,L) :- findall(G,genre(M,G),L) .
have_common_element(L1,L2, E) :- member(E, L1), member(E,L2) .
all_common_elements(L1,L2,Common) :- findall(E,have_common_element(L1,L2, E),Common) .

very_similar_genre(M1,M2) :- genre(M1, G1), genre(M1, G2), genre(M1, G3), genre(M1, G4), G1 \= G2, G1 \= G3, G2 \= G3, G1 \= G4, G2 \= G4, G3 \= G4, genre(M2, G1), genre(M2, G2), genre(M2, G3), genre(M2, G4), M1 \= M2.
very_similar_genre_all(M1,L) :- setof(M2,very_similar_genre(M1,M2),L) .

find_sim_1(X, Y):- genre(X, G1), genre(Y, G1), X \= Y.

similar_genre(M1,M2) :- genre(M1, G1), genre(M1, G2), genre(M1, G3), G1 \= G2, G1 \= G3, G2 \= G3, genre(M2, G1), genre(M2, G2), genre(M2, G3), M1 \= M2.
similar_genre_all(M1,L) :- setof(M2,similar_genre(M1,M2),L) .

very_similar_plot(M1,M2) :- plotkeywords(M1, G1), plotkeywords(M1, G2), plotkeywords(M1, G3), plotkeywords(M1, G4), G1 \= G2, G1 \= G3, G2 \= G3, G1 \= G4, G2 \= G4, G3 \= G4, plotkeywords(M2, G1), plotkeywords(M2, G2), plotkeywords(M2, G3), plotkeywords(M2, G4), M1 \= M2.
very_similar_plot_all(M1,L) :- setof(M2,very_similar_plot(M1,M2),L) .

similar_plot(M1,M2) :- plotkeywords(M1, G1), plotkeywords(M1, G2), plotkeywords(M1, G3), G1 \= G2, G1 \= G3, G2 \= G3, plotkeywords(M2, G1), plotkeywords(M2, G2), plotkeywords(M2, G3), M1 \= M2.
similar_plot_all(M1,L) :- setof(M2,similar_plot(M1,M2),L) .

same_lead_actors(M1,M2) :- actors(M1,A1,A2,A3), actors(M2,A1,A2,A3), M1 \= M2, A1 \= 'UNK', A2 \= 'UNK', A3 \= 'UNK' .

similar_lead_actors(M1,M2) :- actors(M1,A1,A2,A3), actors(M2,A1,A2,A4), M1 \= M2, A1 \= 'UNK', A2 \= 'UNK', A3 \= A4 .
similar_lead_actors(M1,M2) :- actors(M1,A1,A3,A2), actors(M2,A1,A4,A2), M1 \= M2, A1 \= 'UNK', A2 \= 'UNK', A3 \= A4 .
similar_lead_actors(M1,M2) :- actors(M1,A3,A1,A2), actors(M2,A4,A1,A2), M1 \= M2, A1 \= 'UNK', A2 \= 'UNK', A3 \= A4 .

semi_similar_lead_actors(M1,M2) :- actors(M1,A1,A2,A3), actors(M2,A1,A4,A5), M1 \= M2, A1 \= 'UNK', A2 \= A4, A3 \= A5, A2 \= A3, A2 \= A5, A3 \= A4 .
semi_similar_lead_actors(M1,M2) :- actors(M1,A1,A2,A3), actors(M2,A4,A1,A5), M1 \= M2, A1 \= 'UNK', A2 \= A4, A3 \= A5, A2 \= A3, A2 \= A5, A3 \= A4 .
semi_similar_lead_actors(M1,M2) :- actors(M1,A1,A2,A3), actors(M2,A4,A5,A1), M1 \= M2, A1 \= 'UNK', A2 \= A4, A3 \= A5, A2 \= A3, A2 \= A5, A3 \= A4 .
semi_similar_lead_actors(M1,M2) :- actors(M1,A2,A1,A3), actors(M2,A1,A4,A5), M1 \= M2, A1 \= 'UNK', A2 \= A4, A3 \= A5, A2 \= A3, A2 \= A5, A3 \= A4 .
semi_similar_lead_actors(M1,M2) :- actors(M1,A2,A1,A3), actors(M2,A4,A1,A5), M1 \= M2, A1 \= 'UNK', A2 \= A4, A3 \= A5, A2 \= A3, A2 \= A5, A3 \= A4 .
semi_similar_lead_actors(M1,M2) :- actors(M1,A2,A1,A3), actors(M2,A4,A5,A1), M1 \= M2, A1 \= 'UNK', A2 \= A4, A3 \= A5, A2 \= A3, A2 \= A5, A3 \= A4 .
semi_similar_lead_actors(M1,M2) :- actors(M1,A2,A3,A1), actors(M2,A1,A4,A5), M1 \= M2, A1 \= 'UNK', A2 \= A4, A3 \= A5, A2 \= A3, A2 \= A5, A3 \= A4 .
semi_similar_lead_actors(M1,M2) :- actors(M1,A2,A3,A1), actors(M2,A4,A1,A5), M1 \= M2, A1 \= 'UNK', A2 \= A4, A3 \= A5, A2 \= A3, A2 \= A5, A3 \= A4 .
semi_similar_lead_actors(M1,M2) :- actors(M1,A2,A3,A1), actors(M2,A4,A5,A1), M1 \= M2, A1 \= 'UNK', A2 \= A4, A3 \= A5, A2 \= A3, A2 \= A5, A3 \= A4 .

same_language(M1,M2) :- language(M1,L1), language(M2,L1), M1 \= M2.

same_studio(M1,M2) :- production_company(M1,S), production_company(M2,S), M1 \= M2 .

same_country(M1,M2) :- production_country(M1,S), production_country(M2,S), M1 \= M2 .

get_year(M,Year) :- date(M,Date), split_string(Date, "-", "", [Year,Month,Day]).
get_decade(Y,D) :- sub_string(Y, 0, 3, After, D) .
get_movie_decade(M,Decade) :- get_year(M,Year), get_decade(Year,Decade) .
same_decade(M1,M2) :- get_movie_decade(M1,D), get_movie_decade(M2, D), M1 \= M2 .

similar_5(M1,Final) :- (
    very_similar_genre_all(M1,L1),
    similar_plot_all(M1,L2),
    all_common_elements(L1,L2,Common),
    include(same_language(M1),Common,Commonlang),
    include(semi_similar_lead_actors(M1),Commonlang,Final)
);(
    similar_plot_all(M1,L1),
    director(M1,Dir),
    directed_by(Dir,Ldir),
    delete(Ldir,M1,L2),
    all_common_elements(L1,L2,Common),
    include(same_studio(M1),Common,Final)
);(
    similar_genre_all(M1,L1),
    similar_plot_all(M1,L2),
    all_common_elements(L1,L2,Common),
    include(same_studio(M1),Common,Final)
).

similar_4(M1,Final) :- (
    very_similar_genre_all(M1,L1),
    very_similar_plot_all(M1,L2),
    all_common_elements(L1,L2,Final)
);(
    similar_plot_all(M1,L1),
    director(M1,Dir),
    directed_by(Dir,L2),
    all_common_elements(L1,L2,Final)
);(
    similar_genre_all(M1,L1),
    similar_plot_all(M1,L2),
    all_common_elements(L1,L2,Common),
    include(similar_lead_actors(M1),Common,Final)
).

similar_3(M1,Final) :- (
    similar_plot_all(M1,L1),
    include(same_studio(M1),L1,Final)
);(
    setof(M2,similar_lead_actors(M1,M2),L1),
    include(same_language(M1),L1,Commonlang),
    include(same_country(M1),Commonlang,Final)
).

similar_2(M1, Final) :- (
    setof(M2,find_sim_1(M1,M2),L1),
    similar_plot_all(M1,L2),
    all_common_elements(L1,L2,Common),
    include(semi_similar_lead_actors(M1),Common,Final)
).

similar_1(M1, Final) :- (
    setof(M2,find_sim_1(M1,M2),L1),
    similar_plot_all(M1,L2),
    all_common_elements(L1,L2,Common),
    include(same_studio(M1),Common,Final)
).