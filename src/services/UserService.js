const User = require('../models/User')

const UserService = {
    async createUser(userData){

        if(user.password){
            
        }

        const user = await User.create(userData)
        return user
    }
}