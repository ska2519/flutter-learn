module.exports = {
    root: true,
    env: {
        es6: true,
        node: true,
    },
    extends: [
        'eslint:recommended',
        'plugin:import/errors',
        'plugin:import/warnings',
        'plugin:import/typescript',
        'google',
        'plugin:@typescript-eslint/recommended',
    ],
    parser: '@typescript-eslint/parser',
    parserOptions: {
        project: ['tsconfig.json', 'tsconfig.dev.json'],
        tsconfigRootDir: __dirname,
        sourceType: 'module',
    },
    ignorePatterns: [
        '/lib/**/*', // Ignore built files.
    ],
    plugins: [
        '@typescript-eslint',
        'import',
    ],
    rules: {
        'quotes': ['error', 'single'],
        'indent': 'off',
        'max-len': 'off',
        // 'no-unused-vars': 'off',
        '@typescript-eslint/no-unused-vars': 'off',
        'camelcase': 'off',
    },
};
