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
    public class UserBuildercs
    {
        private AfriArtisan_Store_Context _context;

        public UserBuildercs()
        {
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<TM_USR_User, User>()
            .ForMember(dest => dest.UserCode, opts => opts.MapFrom(src => src.usr_code))
            .ForMember(dest => dest.DateModified, opts => opts.MapFrom(src => src.usr_date_modified))
            .ForMember(dest => dest.FirsName, opts => opts.MapFrom(src => src.usr_first_name))
            .ForMember(dest => dest.LastLoginDate, opts => opts.MapFrom(src => src.usr_last_login_date))
            .ForMember(dest => dest.Surname, opts => opts.MapFrom(src => src.usr_surname))
            );
            _context = new AfriArtisan_Store_Context();
        }


        public int SignUp(UserSignUp signUpInfo)
        {
            int userCode = 0;
            var passwordHash = Hashing.ComputeHash(signUpInfo.Password, "SHA256", Encoding.UTF8.GetBytes(signUpInfo.EmailAddress));
            var user = new TM_USR_User
            {
                usr_date_modified = DateTime.Now,
                usr_email_address = signUpInfo.EmailAddress,
                usr_enabled = true,
                usr_first_name = signUpInfo.FirstName,
                usr_last_login_date = null,
                usr_password = passwordHash,
                usr_surname = signUpInfo.Surname
            };

            if (_context.User.FirstOrDefault(c => c.usr_email_address == signUpInfo.EmailAddress) == null)
            {
                var usr = _context.User.Add(user);
                userCode = usr.usr_code;
            }
            _context.SaveChanges();
            return userCode;
        }
        
        public User SignIn(string emailAddres, string password)
        {
            var user = _context.User.FirstOrDefault(c => c.usr_email_address == emailAddres);

            if (user != null)
            {
                if (!Hashing.VerifyHash(password, "SHA256", user.usr_password))
                    throw new UnauthorizedAccessException("invalid email or password");

            }

            return Mapper.Map<User>(user);

        }

        public User GetUser(int userCode)
        {
            var user = Mapper.Map<User>(_context.User.Where(c => c.usr_code == userCode));

            if (user != null)
                return user;
            else
                return new User();
        }

    }
}
