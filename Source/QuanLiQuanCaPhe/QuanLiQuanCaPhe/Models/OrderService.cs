﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using QuanLiQuanCaPhe.ViewModel;

namespace QuanLiQuanCaPhe.Models
{
    public class UserService
    {
        private static NhanVien _CurrentUser = null;
        public static NhanVien GetCurrentUser
        {
            get
            {
                return _CurrentUser;
            }
            set
            {
                _CurrentUser = value;
            }
        }
        //public static NhanVien GetCurrentUser()
        //{
        //    return DataProvider.ISCreated.DB.NhanViens.FirstOrDefault();
        //}
    }
    public class OrderService
    {
        // API
        public static string GetUser()
        {
            return "Phúc";
        }
        private static bool _HasChanges = false;
        public static bool HasChanges()
        {
            if (!_HasChanges)
                return false;

            _HasChanges = false;
            return true;
        }
        public static void AddOrder(Order item)
        {
            _HasChanges = true;
            DataAccess.AddOrder(item);
        }
        public static string GetNextOrderID()
        {
            return DataAccess.GetNextOrderID();
        }

        public static double ValidateCoupon(string CouponCode)
        {
            if (CouponCode == "MAGIAMGIA")
            {
                return 20;
            }
            return 0;
        }

        public static List<Category> GetCategories()
        {
            List<Category> _ListCategory = new List<Category>();
            _ListCategory.Add(new Category() { Name = "Hôm nay", ID = "day" });
            _ListCategory.Add(new Category() { Name = "Tuần này", ID = "week" });
            _ListCategory.Add(new Category() { Name = "Tháng này", ID = "month" });
            _ListCategory.Add(new Category() { Name = "Tất cả", ID = null });
            return _ListCategory;
        }

        public static List<Order> GetOrderByCategory(Category value)
        {
            if (value == null)
                return null;
            switch (value.ID)
            {
                case "day":
                    return DataAccess.GetOrderToday();
                case "week":
                    return DataAccess.GetOrderThisWeek();
                case "month":
                    return DataAccess.GetOrderThisMonth();
                default:
                    return DataAccess.GetAllOrder();
            }
        }
        public static List<OrderItem> GetOrderItems(DonHang DonHang)
        {
            return DonHang.ChiTietDonhangs.ToList().Where(x => x.ISDEL != 1).Select(x => new OrderItem(x)).ToList();
        }
    }

    public class DrinkService
    {
        // API
        public static List<Category> GetCategories()
        {
            //return FakeData.GetCategories();
            return DataAccess.GetCategories();
        }
        public static List<Drink> GetDrinkFromCategory(Category category)
        {
            //return FakeData.GetDrinkFromCategory(_ListCategory.Name);
            return DataAccess.GetDrinkFromCategory(category);
        }
    }
    public class DataAccess
    {
        public static List<Category> GetCategories()
        {
            List<Category> list = new List<Category>(DataProvider.ISCreated.DB.LoaiMonAns.ToList().Where(x => x.ISDEL != 1).Select(x => new Category(x)));
            list.Insert(0, new Category() { Name = "Tất cả", ID = null });
            return list;
        }
        public static List<Drink> GetDrinkFromCategory(Category category)
        {
            List<Drink> list = DataProvider.ISCreated.DB.MonAns.ToList().Where(x => x.ISDEL != 1 && (category.ID == null || x.MALOAI == category.ID)).Select(x => new Drink(x)).ToList();
            return list;
        }

        public static string GetNextOrderID()
        {
            DonHang LastID = DataProvider.ISCreated.DB.DonHangs.OrderByDescending(a => a.MADH).FirstOrDefault();
            int id = 0;
            if (LastID == null || !Int32.TryParse(LastID.MADH, out id))
            {
                return "0";
            }
            id++;
            return id + "";
        }
        public static void AddOrder(Order order)
        {
            DataProvider.ISCreated.DB.DonHangs.Add(order.ToDonHang());
            DataProvider.ISCreated.DB.ChiTietDonhangs.AddRange(order.ToChiTietDonHangs());
            DataProvider.ISCreated.DB.SaveChanges();
        }
        private static List<Order> GetOrderBy(Func<DonHang, bool> Condition)
        {
            List<Order> list =
                DataProvider.ISCreated.DB.DonHangs.ToList()
                .Where(x => Condition(x) && x.ISDEL != 1)
                .Select(x => new Order(x))
                .ToList();
            return list;
        }

        public static List<Order> GetOrderToday()
        {
            return GetOrderBy(IsInToday);
        }
        public static List<Order> GetOrderThisWeek()
        {
            return GetOrderBy(IsInThisWeek);
        }
        public static List<Order> GetOrderThisMonth()
        {
            return GetOrderBy(IsInThisMonth);
        }
        public static List<Order> GetAllOrder()
        {
            return GetOrderBy((DonHang) => { return true; });
        }
        private static bool IsInToday(DonHang DonHang)
        {
            return AreInSameDay(DonHang.CREADTEDAT.Value, DateTime.Now);
        }
        private static bool IsInThisWeek(DonHang DonHang)
        {
            return AreInSameWeek(DonHang.CREADTEDAT.Value, DateTime.Now);
        }
        private static bool IsInThisMonth(DonHang DonHang)
        {
            return AreInSameMonth(DonHang.CREADTEDAT.Value, DateTime.Now);
        }
        private static bool AreInSameDay(DateTime date1, DateTime date2)
        {
            return (date1.Year == date2.Year && date1.Month == date2.Month & date1.Day == date2.Day);
        }
        private static bool AreInSameWeek(DateTime date1, DateTime date2)
        {
            if (date1.Year != date2.Year || date1.Month != date2.Month)
                return false;
            var cal = System.Globalization.DateTimeFormatInfo.CurrentInfo.Calendar;
            var d1 = date1.Date.AddDays(-1 * (int)cal.GetDayOfWeek(date1));
            var d2 = date2.Date.AddDays(-1 * (int)cal.GetDayOfWeek(date2));
            return d1 == d2;
        }
        private static bool AreInSameMonth(DateTime date1, DateTime date2)
        {
            return (date1.Year == date2.Year && date1.Month == date2.Month);
        }
    }

}
