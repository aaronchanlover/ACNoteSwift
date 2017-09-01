import Foundation 
import SQLite


/// 此方法只能更新一个版本，如果存在多个版本的话需要在Migrations.bundle中实现
struct SeedDB: Migration {
  var version: Int64 = 201708171957001

  func migrateDatabase(_ db: Connection) throws {
    let users = Table("users")
    let id = Expression<Int64>("id")
    let name = Expression<String?>("name")
    let passwd = Expression<String>("passwd")
    let gesturepwd = Expression<String>("gesturepwd")
    
    try db.run(users.create { t in
        t.column(id, primaryKey: PrimaryKey.autoincrement)
        t.column(name,unique:true)
        t.column(passwd)
        t.column(gesturepwd)
    })
    
  }
}
