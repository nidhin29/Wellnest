# WellNest - Healthcare Management App

**A comprehensive healthcare management application built with Flutter**


## 📱 About WellNest

WellNest is a modern healthcare management application that bridges the gap between patients and healthcare providers. Built with Flutter and following clean architecture principles, the app provides a seamless experience for booking appointments, managing health records, and communicating with doctors.

### ✨ Key Features

#### 🏥 **Patient Management**
- **User Registration & Authentication**: Secure email/password-based authentication
- **Profile Management**: Complete patient profile with personal and medical information
- **Health Records**: Track medical history and personal health data
- **User Session Management**: Secure authentication system

#### 👩‍⚕️ **Doctor & Appointment Management**
- **Doctor Discovery**: Browse available doctors with specializations and ratings
- **Appointment Booking**: Interactive calendar-based appointment scheduling
- **Doctor Profiles**: Detailed doctor information including experience, education, and patient reviews
- **Real-time Availability**: Appointment slot availability checking
- **Appointment History**: Track past and upcoming appointments

#### 💬 **Communication System**
- **Doctor-Patient Chat**: Real-time messaging between patients and doctors
- **Appointment-based Communication**: Chat functionality available during appointment times
- **Message History**: Complete conversation history and management
- **Real-time Notifications**: Push notifications for messages and appointments

#### 📊 **Health & Wellness**
- **Health Tips**: Daily health tips and wellness advice


## 🏗️ Architecture & Design

### **Clean Architecture Implementation**

```
lib/
├── Application/              # Business Logic Layer (BLoCs & Cubits)
│   ├── edit_profile/         # Profile editing logic
│   ├── home/                 # Home dashboard logic
│   ├── loggedin/             # Authentication state management
│   ├── message/              # Messaging system logic
│   ├── profile/              # User profile management
│   ├── schedule/             # Appointment scheduling logic
│   ├── signin/               # Sign-in functionality
│   └── signup/               # User registration logic
│
├── Domain/                   # Business Models & Interfaces
│   ├── Failure/              # Error handling models
│   ├── Home/                 # Home page models and services
│   ├── LoggedIn/             # Authentication models
│   ├── Message/              # Messaging system models
│   ├── Profile/              # User profile models
│   ├── Schedule/             # Appointment models
│   ├── SignIn/               # Authentication models
│   ├── SignUp/               # Registration models
│   └── TokenManager/         # Session management
│
├── Infrastructure/           # Data Layer & External Services
│   ├── Home/                 # Home data repositories
│   ├── Message/              # Messaging repositories
│   ├── Profile/              # Profile data management
│   ├── Schedule/             # Appointment data handling
│   ├── SignIn/               # Authentication repositories
│   └── SignUp/               # Registration repositories
│
├── Presentation/             # UI Layer
│   ├── Appointments/         # Appointment booking screens
│   ├── Auth/                 # Authentication UI
│   ├── common widgets/       # Reusable UI components
│   ├── Home/                 # Main dashboard
│   ├── Messages/             # Chat and messaging UI
│   ├── Profile/              # Profile management screens
│   └── Splash/               # App launch screen
│
├── core/
│   └── injectable/           # Dependency injection setup
│
└── main.dart                 # App entry point
```

### **Key Design Patterns**

#### **BLoC/Cubit Pattern**
- **State Management**: Predictable state management using BLoC pattern
- **Event-Driven**: Reactive programming with clear separation of concerns

#### **Dependency Injection**
- **GetIt**: Service locator pattern for dependency management
- **Injectable**: Code generation for automatic dependency registration

#### **Repository Pattern**
- **Data Abstraction**: Clean separation between data sources and business logic
- **Error Handling**: Consistent error handling across all data operations

## 🛠️ Technology Stack

### **Frontend Framework**
- **Flutter**: Cross-platform mobile app development
- **Dart**: Primary programming language
- **Material Design**: Google's design system for consistent UI

### **State Management**
- **Flutter BLoC**: Business Logic Component pattern
- **Cubit**: Simplified BLoC for simple state management
- **Freezed**: Immutable data classes with code generation

### **Backend & Data**
- **Firebase Core**: Backend infrastructure
- **Firebase Messaging**: Push notifications
- **Dio**: HTTP client for API communications
- **Shared Preferences**: Local data persistence

### **UI & User Experience**
- **Google Fonts**: Custom typography
- **Shimmer**: Loading state animations
- **Lottie**: Vector animations for success states
- **Table Calendar**: Interactive calendar widget
- **Emoji Picker**: Enhanced messaging experience

### **Functional Programming**
- **Dartz**: Functional programming utilities
- **Either**: Type-safe error handling
- **Option**: Null-safety with functional approach

## 📱 Core Features Deep Dive


### **Profile Management**
- **Complete Profiles**: Comprehensive user information management
- **Health Data**: Medical history and personal health information
- **Security**: Secure profile data with encryption

## 📱 User Interface

### **Modern Design**
- **Material Design 3**: Latest design guidelines
- **Responsive Layout**: Adaptive UI for different screen sizes
- **Accessibility**: Screen reader support and accessibility features
- **Dark/Light Themes**: Customizable appearance (extensible)

### **User Experience**
- **Intuitive Navigation**: Clear and consistent navigation patterns
- **Loading States**: Shimmer effects for better perceived performance
- **Error Handling**: User-friendly error messages and recovery options
- **Offline Support**: Basic offline functionality with local storage

## 🚀 Getting Started

### **Prerequisites**
```bash
Flutter SDK >=3.4.4
Dart SDK >=3.4.4
Android Studio / VS Code with Flutter extensions
Firebase account (for backend services)
```

### **Installation**

1. **Clone the repository**
   ```bash
   git clone https://github.com/nidhin29/Wellnest.git
   cd Wellnest
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```


5. **Run the application**
   ```bash
   flutter run
   ```


## 🤝 Contributing

We welcome contributions! 

### **Development Setup**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### **Code Standards**
- Follow Dart/Flutter style guidelines
- Use meaningful commit messages
- Add tests for new features
- Update documentation as needed



#

<div align="center">

**Built with ❤️ for better healthcare accessibility**

</div>
