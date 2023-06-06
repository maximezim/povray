// définir les propriétés d'un objet

material {
    // on peut superposer plusieurs textures
    texture {
        // teinte et transparence de surface
        pigment {
            // par défaut couleur noire

            color rgb <1,1,1>
            color rgbt <1,1,1,1> // transparence transmise (couleur de la lumière pas affectée)
            color rgbf <1,1,1,1> //transparence vitreuse
            color rgbft <1,1,1,1,1> // transparence transmise et vitreuse

            pattern {
                // motifs
            }

            cells {
                // motifs de cellules
            }
        }

        // differnece entre mat et brillant
        finish{
            // par défaut surface mate
            // état de surface
            
            ambient 0.1 // réflexion ambiante (en général 10%)
            diffuse 0.6 // réflexion diffuse (renvoie la lumière dans toutes les directions) = mat
            specular 0.4 // réflexion spéculaire (renvoie la lumière dans une direction privilégiée) = brillant/satiné
            roughness 1E-3 // rugosité de la surface (0 = lisse, 1 = rugueux) (avec specular, plus c'est lisse, plus c'est brillant)

            reflection 0.5 // réflexion (contribution des autres objets de la scène à la réflexion) (0 = pas de réflexion, 1 = réflexion totale)
            // ex miroir : spéculaire et très réfléchissant
        }

        // micro relief
        normal {
            // pas de valeurs par défaut pour ce bloc
        }
    }
    interior {
        // refraction ior
        // filtrage
    }
}