using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;

namespace SmartE
{
    public class Security
    {
        public static string GetHash256(string password, string salt)
        {
            byte[] passwordByte = ASCIIEncoding.ASCII.GetBytes(password + salt + "HS");

            HashAlgorithm algorithm = SHA256.Create();
            byte[] hashPassword = algorithm.ComputeHash(passwordByte);
            return Convert.ToBase64String(hashPassword);
        }

        public static string GetHash512(string password, string salt)
        {
            byte[] passwordByte = ASCIIEncoding.ASCII.GetBytes(password + salt + "HS");

            HashAlgorithm algorithm = SHA512.Create();
            byte[] hashPassword = algorithm.ComputeHash(passwordByte);
            return Convert.ToBase64String(hashPassword);
        }

    }
}