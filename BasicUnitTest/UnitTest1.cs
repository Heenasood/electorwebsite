using System;
using System.Windows;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SmartE;

namespace BasicUnitTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void Test_Login()
        {
            bool expected_result = true;
            bool actual_result = DataAccessLayer.Equals("admin", "admin");
            Assert.AreEqual(expected_result, actual_result, "Test is passed");
            System.Diagnostics.Debug.WriteLine("Test Finished!");
            Debug.WriteLine("ALL test Passed ****");
        } 
    }
}
