package co.za.carolsBoutiqueServer.report.service;

import co.za.carolsBoutiqueServer.report.model.Report;
import co.za.carolsBoutiqueServer.report.model.ReportCriteria;
import java.util.List;

public interface IServiceReport {
    
    List<Report> findTopStoresInTermsOfSales(ReportCriteria rc); 
    List<Report> findHighestRatedStores(ReportCriteria rc);
    List<Report> findStoreMonthlySales(ReportCriteria rc);
    List<Report> findTopSellingEmployees(ReportCriteria rc);
    List<Report> findStoreThatAchievedMonthlyTarget(ReportCriteria rc);
    List<Report> findTop40Products();
    List<Report> findUnderPerformingStores(ReportCriteria rc);
    Report findTopSalepersonForAProduct(ReportCriteria rc);
    Report findCurrentDailySales(ReportCriteria rc);
}
