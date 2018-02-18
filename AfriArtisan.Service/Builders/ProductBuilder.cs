using AfriArtisan.Data;
using AfriArtisan.Data.Models;
using AfriArtisan.Domain.DTOs;
using AfriArtisan.Domain.Enums;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Service.Builders
{
    public class ProductBuilder
    {
        #region Private Members

        private AfriArtisan_Store_Context _context;

        #endregion Private Members

        #region CTOR

        public ProductBuilder()
        {
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<TM_PRD_Product, Product>()
            .ForMember(dest => dest.Code, opts => opts.MapFrom(src => src.prd_code))
            .ForMember(dest => dest.ProductType, opts => opts.MapFrom(src => src.pdt_code))
            .ForMember(dest => dest.Colour, opts => opts.MapFrom(src => src.prd_color))
            .ForMember(dest => dest.Cost, opts => opts.MapFrom(src => src.prd_cost))
            .ForMember(dest => dest.DateAdded, opts => opts.MapFrom(src => src.prd_date_added))
            .ForMember(dest => dest.Dimensions, opts => opts.MapFrom(src => src.prd_dimensions))
            .ForMember(dest => dest.ItemNumber, opts => opts.MapFrom(src => src.prd_item_number))
            .ForMember(dest => dest.Weight, opts => opts.MapFrom(src => src.prd_weight))
            
            );
            _context = new AfriArtisan_Store_Context();
        }

        #endregion CTOR

        #region GetProducts

        public List<Product> GetAllProducts()
        {
            var productList = new List<Product>();
            var products = Mapper.Map<List<Product>>(_context.Products.ToList());

            foreach (var prod in products)
            {
                prod.ProductImages.AddRange(AddImages(prod));
                productList.Add(prod);
            }
            return productList;
        }

        public List<Product> GetProductByType(int productType)
        {
            var productList = new List<Product>();
            var products = Mapper.Map<List<Product>>(_context.Products.Where(c => c.pdt_code == productType));
            
            foreach(var prod in products)
            {
                prod.ProductImages.AddRange(AddImages(prod));
                productList.Add(prod);
            }
            return productList;
        }

        public List<ProductImage> AddImages(Product product)
        {
            var productImages = new List<ProductImage>();
            var images = _context.ProductImage.Where(c => c.prd_code == product.Code).ToList();
            if (images != null)
            {
                foreach (var img in images)
                    productImages.Add(new ProductImage
                    {
                        ImageLocation = img.pil_image_location,
                        ImageType = (ImageType)img.imt_code
                    });
            }
            return productImages;
        }

        #endregion GetProducts
    }
}
