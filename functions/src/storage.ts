import * as functions from 'firebase-functions';

import {Storage} from '@google-cloud/storage';
const gcs = new Storage();

import {tmpdir} from 'os';
import {join, dirname} from 'path';
import * as sharp from 'sharp';

export const resizeAvatar = functions.storage
    .object()
    .onFinalize(async (object) => {
        const bucket = gcs.bucket(object.bucket);
        const filePath = object.name!;
        console.log('filePath:', filePath);

        const fileName = filePath?.split('/').pop();
        console.log('fileName:', fileName);
        // const tmpFilePath = join(object.name!);
        const tmpFilePath = join(tmpdir(), object.name!);
        console.log('tmpFilePath:', tmpFilePath);

        const avatarFileName = 'avatar_' + fileName;
        // const tmpAvatarPath = join(avatarFileName);
        const tmpAvatarPath = join(tmpdir(), avatarFileName);
        console.log('tmpAvatarPath:', tmpAvatarPath);

        if (fileName?.includes('avatar_')) {
            console.log('exiting function');
            return false;
        }

        await bucket.file(filePath)
            .download({destination: filePath});

        await sharp(filePath)
            .resize(100, 100)
            .toFile(tmpAvatarPath);

        return bucket.upload(tmpAvatarPath, {
            destination: join(dirname(filePath), avatarFileName),
        });
    });
