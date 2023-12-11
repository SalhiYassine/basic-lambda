import { Handler } from 'aws-lambda';

const getSomethingHandler: Handler = async (event, context) => {

  console.log({
    event, context
  })

  return {
    statusCode: 200,
    body: JSON.stringify({ message: 'got something' }),
  };
};

const getSomethingElseHandler: Handler = async (event, context) => {

  console.log({
    event, context
  })

  return {
    statusCode: 200,
    body: JSON.stringify({ message: 'got something else.' }),
  };
};

export { getSomethingHandler, getSomethingElseHandler };
