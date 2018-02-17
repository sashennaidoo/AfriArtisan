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
    public class ProductTypeBuilder
    {
        private AfriArtisan_Store_Context _context;
        private Mapper _mapper;

        public ProductTypeBuilder()
        {
            
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<TR_PDT_Product_Type, ProductType>()
            .ForMember(dest => dest.Code, opts => opts.MapFrom(src => src.pdt_code))
            .ForMember(dest => dest.Description, opts => opts.MapFrom(src => src.pdt_description))
            .ForMember(dest => dest.IsEnabled, opts => opts.MapFrom(src => src.pdt_enabled)));
            //_mapper = new Mapper(config);

            _context = new AfriArtisan_Store_Context();
        }
        
        public List<ProductType> GetAllProductTypes()
        {
            var prods = _context.ProductTypes.Where(c => c.pdt_code > 0);
            var products = Mapper.Map<List<ProductType>>(_context.ProductTypes.ToList());
            return products;
        }

        public void AddProductType(string description, bool isEnabled)
        {
            _context.ProductTypes.Add(new TR_PDT_Product_Type
            {
                pdt_code = 1,
                pdt_description = "description",
                pdt_enabled = isEnabled
            });
        }

    }
}
