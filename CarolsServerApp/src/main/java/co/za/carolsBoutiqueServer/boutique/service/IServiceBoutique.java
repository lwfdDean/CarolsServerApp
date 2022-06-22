package co.za.carolsBoutiqueServer.boutique.service;

import co.za.carolsBoutiqueServer.boutique.model.Boutique;
import co.za.carolsBoutiqueServer.boutique.model.Review;
import java.util.List;

public interface IServiceBoutique {
    List<Boutique> getAllBoutiques();
    String registerNewBoutique(Boutique boutique);
    Boutique findBoutique(String boutiqueId);
    String updateBoutqiue(Boutique boutique);

    public String rateTheBoutique(Review review);
}
