using AfriArtisan.Data;
using AfriArtisan.Data.Models;
using AfriArtisan.Domain.DTOs;
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
        private AfriArtisan_Store_Context _context;

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

        public List<Product> GetProductByType(int productType)
        {
            var productList = new List<Product>();
            var products = Mapper.Map<List<Product>>(_context.Products.Where(c => c.pdt_code == productType));
            return products;
        }
    }
}
