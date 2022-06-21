package co.za.carolsBoutiqueServer.boutique.service;

import co.za.carolsBoutiqueServer.boutique.model.Boutique;
import co.za.carolsBoutiqueServer.boutique.model.Review;
import java.util.List;
import java.util.Map;

public interface IServiceBoutique {
    List<Boutique> getAllBoutiques();
    String registerNewBoutique(Boutique boutique);
    Boutique login(Map<String,String> loginDetails);
    String changePassword(Map<String, String> passwordDetails);
    String changeDailyTarget(Map<String,Double> newTarget);

    public String rateTheBoutique(Review review);
}
