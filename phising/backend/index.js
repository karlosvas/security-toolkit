import express from 'express';
import mongoose from 'mongoose';
import cors from 'cors';
import dotenv from 'dotenv';
dotenv.config();

const app = express();
const dbUsername = process.env.DB_USERNAME;
const dbPassword = process.env.DB_PASSWORD;
const dbName = process.env.DB_NAME;

console.log(dbName, dbUsername, dbPassword);
app.use(cors());
app.use(express.json()); // Asegúrate de usar este middleware para parsear JSON

const mongoUri = `mongodb+srv://${dbUsername}:${dbPassword}@cluster0.zf0tv.mongodb.net/${dbName}?retryWrites=true&w=majority`;

mongoose.connect(mongoUri, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(() => {
    console.log('Conectado a MongoDB Atlas');
}).catch((err) => {
    console.error('Error al conectar a MongoDB:', err);
});

// Definir un esquema de usuario
const usuarioSchema = new mongoose.Schema({
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true }
});

const Usuario = mongoose.model('Usuario', usuarioSchema);

app.get('/', async (req, res) => {
    res.send('API de phishing etico');
});

app.post('/usuarios', async (req, res) => {
    const { email, password } = req.body;
    console.log(email, password)
    // Validar los datos de entrada
    if (!email || !password) {
        return res.status(400).json({ message: 'Faltan datos: email y/o contraseña.' });
    }

    try {
        // Crear un nuevo usuario
        const nuevoUsuario = new Usuario({ email, password });
        await nuevoUsuario.save(); // Guardar en la base de datos

        console.log('Usuario creado correctamente:', nuevoUsuario);
        res.status(201).json({
            message: 'Usuario creado correctamente',
            userId: nuevoUsuario._id
        });
    } catch (err) {
        console.error('Error al crear el usuario:', err);
        res.status(500).json({ message: 'Error al crear el usuario.', error: err });
    }
});

// Ruta para obtener todos los usuarios
app.get('/usuarios', async (req, res) => {
    try {
        const usuarios = await Usuario.find(); // Obtener todos los usuarios
        res.json(usuarios);
    } catch (err) {
        console.error('Error al obtener usuarios:', err);
        res.status(500).json({ message: 'Error al obtener los usuarios.', error: err });
    }
});

app.listen(8080, () => {
    console.log('Server is running on http://localhost:8080');
});