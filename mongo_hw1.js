gymDatabase> db.clients.insertOne({client_id: 1, name: "Roman", age: 36, email: "test@email.com"})
{
  acknowledged: true,
  insertedId: ObjectId('68138228f79500003efc2171')
}------------------------------------------------------------------------------------------------------------------------------


gymDatabase> db.clients.insertOne({client_id: 2, name: "Anna", age: 29, email: "anna.smith@example.com"});
... db.clients.insertOne({client_id: 3, name: "James", age: 42, email: "james.brown@example.com"});
... db.clients.insertOne({client_id: 4, name: "Maria", age: 33, email: "maria.garcia@example.com"});
... db.clients.insertOne({client_id: 5, name: "David", age: 25, email: "david.lee@example.com"});
... db.clients.insertOne({client_id: 6, name: "Sophie", age: 38, email: "sophie.johnson@example.com"});
...
{
  acknowledged: true,
  insertedId: ObjectId('6813da7ef79500003efc2176')
}
------------------------------------------------------------------------------------------------------------------------------
gymDatabase> db.memberships.insertOne({membership_id: 2, client_id: 2, start_date: "15.01.2025", end_date: "14.01.2026", type: "Silver"});
... db.memberships.insertOne({membership_id: 3, client_id: 3, start_date: "01.02.2025", end_date: "31.01.2026", type: "Gold"});
... db.memberships.insertOne({membership_id: 4, client_id: 4, start_date: "10.03.2025", end_date: "09.03.2026", type: "Platinum"});
... db.memberships.insertOne({membership_id: 5, client_id: 5, start_date: "01.04.2025", end_date: "31.03.2026", type: "Silver"});
... db.memberships.insertOne({membership_id: 6, client_id: 6, start_date: "20.05.2025", end_date: "19.05.2026", type: "Gold"});
...
{
  acknowledged: true,
  insertedId: ObjectId('6813db7af79500003efc217c')
}
------------------------------------------------------------------------------------------------------------------------------
gymDatabase> db.workouts.insertOne({workout_id: "x2", description: "upper body strength", difficulty: "hard"});
... db.workouts.insertOne({workout_id: "x3", description: "cardio endurance", difficulty: "moderate"});
... db.workouts.insertOne({workout_id: "x4", description: "core stability", difficulty: "easy"});
... db.workouts.insertOne({workout_id: "x5", description: "full body HIIT", difficulty: "hard"});
... db.workouts.insertOne({workout_id: "x6", description: "stretch and mobility", difficulty: "easy"});
...
{
  acknowledged: true,
  insertedId: ObjectId('6813dc16f79500003efc2182')
}
------------------------------------------------------------------------------------------------------------------------------

gymDatabase> db.trainers.insertOne({trainer_id: "t2", name: "Linda", specialization: "Strength Training"});
... db.trainers.insertOne({trainer_id: "t3", name: "Mark", specialization: "Yoga"});
... db.trainers.insertOne({trainer_id: "t4", name: "Emily", specialization: "Pilates"});
... db.trainers.insertOne({trainer_id: "t5", name: "John", specialization: "CrossFit"});
... db.trainers.insertOne({trainer_id: "t6", name: "Samantha", specialization: "Mobility & Flexibility"});
...
{
  acknowledged: true,
  insertedId: ObjectId('6813dc94f79500003efc2188')
}
------------------------------------------------------------------------------------------------------------------------------

gymDatabase> show collections
clients
memberships
trainers
workouts