// Operation 1: Load Data
// (Run this in mongo shell: load('mongodb_operations.js'))
use fleximart;
var sampleData = [
  { "product_id": "ELEC001", "name": "Samsung Galaxy S21", "category": "Electronics", "price": 45000, "stock": 150, "reviews": [{ "rating": 5 }] },
  { "product_id": "FASH001", "name": "Nike Shoes", "category": "Fashion", "price": 4000, "stock": 50, "reviews": [{ "rating": 4 }] }
];
db.products.insertMany(sampleData);

// Operation 2: Basic Query
// Find Electronics < 50000
var affordableElectronics = db.products.find(
    { "category": "Electronics", "price": { $lt: 50000 } },
    { "name": 1, "price": 1, "stock": 1, "_id": 0 }
);

// Operation 3: Review Analysis
// Products with avg rating >= 4.0
db.products.aggregate([
    { $addFields: { avgRating: { $avg: "$reviews.rating" } } },
    { $match: { avgRating: { $gte: 4.0 } } }
]);

// Operation 4: Update Operation
// Add review to ELEC001
db.products.updateOne(
    { "product_id": "ELEC001" },
    { $push: { "reviews": { "user": "U999", "rating": 4, "comment": "Good value", "date": new Date() } } }
);

// Operation 5: Complex Aggregation
// Avg price by category
db.products.aggregate([
    { $group: {
        _id: "$category",
        avg_price: { $avg: "$price" },
        product_count: { $sum: 1 }
    }},
    { $sort: { avg_price: -1 } }
]);
