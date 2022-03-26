import React, {useState} from 'react';
import {
  Text,
  ImageBackground,
  TouchableOpacity,
  StyleSheet,
  View,
} from 'react-native';

const image = require('./assets/images/image.png');

const App = () => {
  const [count, setCount] = useState(0);
  const isFull = count === 20;
  const isEmpty = count === 0;

  const increment = () => {
    setCount(count + 1);
  };

  const decrement = () => {
    setCount(count - 1);
  };

  return (
    <View style={styles.container}>
      <ImageBackground
        resizeMode="cover"
        source={image}
        style={styles.imageBackground}>
        <Text
          style={[
            styles.text,
            {
              color: isFull ? 'red' : 'white',
            },
          ]}>
          {isFull ? 'Lotado' : 'Pode entrar!'}
        </Text>
        <Text
          style={[
            styles.textCount,
            {
              color: isFull ? 'red' : 'white',
            },
          ]}>
          {count}
        </Text>
        <View style={styles.row}>
          <TouchableOpacity
            disabled={isEmpty}
            onPress={decrement}
            style={[
              styles.button,
              {backgroundColor: isEmpty ? 'rgba(255,255,255,0.2)' : 'white'},
            ]}>
            <Text style={{fontSize: 16, color: 'black', fontWeight: '500'}}>
              Saiu
            </Text>
          </TouchableOpacity>
          <TouchableOpacity
            disabled={isFull}
            onPress={increment}
            style={[
              styles.button,
              {
                marginLeft: 32,
                backgroundColor: isFull ? 'rgba(255,255,255,0.2)' : 'white',
              },
            ]}>
            <Text style={{fontSize: 16, color: 'black', fontWeight: '500'}}>
              Entrou
            </Text>
          </TouchableOpacity>
        </View>
      </ImageBackground>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  imageBackground: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  button: {
    backgroundColor: 'white',
    height: 100,
    width: 100,
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 20,
  },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    width: '100%',
  },
  text: {
    fontSize: 30,
    fontWeight: 'bold',
    color: 'white',
  },
  textCount: {
    fontSize: 100,
    color: 'white',
    padding: 32,
  },
});

export default App;
