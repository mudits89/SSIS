using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public static class Stationery_Catalogue_DAO
    {
        static SSISEntities ssisEntities = new SSISEntities();
        public static List<Stationery_Catalogue> GetStationeryItemsByCategory(String selectedCategory)
        {
            List<Stationery_Catalogue> stationeryCatalogueList = ssisEntities.Stationery_Catalogue.Where(x => x.Category == selectedCategory).OrderBy(x => x.Item_Number).ToList();
            return stationeryCatalogueList;
        }

        public static List<String> GetAllCategoryNames()
        {
            List<String> productCategoryList = ssisEntities.Stationery_Catalogue.Select(x => x.Category).Distinct().ToList();
            return productCategoryList;
        }

        public static Stationery_Catalogue GetStationeryCatalogueByItemId(String itemID)
        {
            Stationery_Catalogue product = ssisEntities.Stationery_Catalogue.Where(x => x.Item_Number == itemID).First();
            return product;
        }

    }
