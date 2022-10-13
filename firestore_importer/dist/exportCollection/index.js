"use strict";
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
var _this = this;
Object.defineProperty(exports, "__esModule", { value: true });
var admin = require("firebase-admin");
var fs = require("fs-extra");
var _ = require("lodash");
var XLSX = require("xlsx");
var shortid = require("shortid");
var dot = require("dot-object");
var shared_1 = require("../shared");
var db = admin.firestore();
var args;
exports.execute = function (file, collectionPaths, options) { return __awaiter(_this, void 0, void 0, function () {
    var json;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                args = options;
                json = {};
                if (!(collectionPaths.length === 0)) return [3 /*break*/, 2];
                console.log('Selecting root collections...');
                return [4 /*yield*/, db.getCollections().then(function (colls) { return colls.map(function (coll) { return coll.path; }); })];
            case 1:
                collectionPaths = _a.sent();
                _a.label = 2;
            case 2:
                console.log('Getting selected collections...');
                getCollections(collectionPaths)
                    .then(function (collections) {
                    if (file.endsWith('.xlsx')) {
                        console.log('Writing to Excel:', file);
                        var book = json2book(collections);
                        XLSX.writeFile(book, file);
                    }
                    else if (file.endsWith('.csv')) {
                        console.log('Writing to CSV:', file);
                        var book = json2book(collections);
                        bookWriteCSV(book, file);
                    }
                    else {
                        console.log('Writing to JSON:', file);
                        return fs.writeJson(file, collections);
                    }
                })
                    .then(function () {
                    console.log('Download was a success!');
                })
                    .catch(function (err) {
                    console.log('Failure: ', err);
                });
                return [2 /*return*/];
        }
    });
}); };
function getCollections(paths) {
    var _this = this;
    return new Promise(function (resolve, reject) { return __awaiter(_this, void 0, void 0, function () {
        var collections, _i, paths_1, path, collection, err_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    collections = {};
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 6, , 7]);
                    _i = 0, paths_1 = paths;
                    _a.label = 2;
                case 2:
                    if (!(_i < paths_1.length)) return [3 /*break*/, 5];
                    path = paths_1[_i];
                    return [4 /*yield*/, getCollection(path)];
                case 3:
                    collection = _a.sent();
                    _.assign(collections, collection);
                    _a.label = 4;
                case 4:
                    _i++;
                    return [3 /*break*/, 2];
                case 5:
                    resolve(collections);
                    return [3 /*break*/, 7];
                case 6:
                    err_1 = _a.sent();
                    reject(err_1);
                    return [3 /*break*/, 7];
                case 7: return [2 /*return*/];
            }
        });
    }); });
}
function getCollection(path) {
    var _this = this;
    var collection = {};
    return db.collection(path).get().then(function (snaps) { return __awaiter(_this, void 0, void 0, function () {
        var _a, _i, _b, snap, doc, subCollPaths, subCollections;
        return __generator(this, function (_c) {
            switch (_c.label) {
                case 0:
                    // try {
                    if (snaps.size === 0) {
                        throw "No ducuments in collection: " + path;
                    }
                    ;
                    _i = 0, _b = snaps.docs;
                    _c.label = 1;
                case 1:
                    if (!(_i < _b.length)) return [3 /*break*/, 6];
                    snap = _b[_i];
                    doc = (_a = {}, _a[snap.id] = snap.data(), _a);
                    // log if requested
                    args.verbose && console.log(snap.ref.path);
                    // Decode Doc
                    shared_1.decodeDoc(doc[snap.id]);
                    if (!args.subcolls) return [3 /*break*/, 4];
                    return [4 /*yield*/, snap.ref.getCollections().then(function (colls) { return colls.map(function (coll) { return coll.path; }); })];
                case 2:
                    subCollPaths = _c.sent();
                    if (!subCollPaths.length) return [3 /*break*/, 4];
                    return [4 /*yield*/, getCollections(subCollPaths)];
                case 3:
                    subCollections = _c.sent();
                    _.assign(doc[snap.id], subCollections);
                    _c.label = 4;
                case 4:
                    // doc to collection
                    _.assign(collection, doc);
                    _c.label = 5;
                case 5:
                    _i++;
                    return [3 /*break*/, 1];
                case 6: return [2 /*return*/];
            }
        });
    }); }).then(function () {
        var _a;
        var collId = path.split('/').pop();
        var collPath = args.collPrefix + ":" + collId;
        return (_a = {}, _a[collPath] = collection, _a);
    });
}
function bookWriteCSV(book, file) {
    var fileParts = file.split('.');
    var indexSheet = book.Sheets['INDEX'];
    var indexJson = XLSX.utils.sheet_to_json(indexSheet);
    // If only one collection, write single file
    var single = book.SheetNames.length === 2;
    if (single) {
        var sheet = book.Sheets[indexJson[0]['Sheet Name']];
        XLSX.writeFile(book, file, { bookType: 'csv' });
        return;
    }
    // Otherwise write an index file and csv per collection
    // write index file
    var filename = fileParts.slice();
    filename.splice(-1, 0, 'INDEX');
    XLSX.writeFile(book, filename.join('.'), { bookType: 'csv', sheet: 'INDEX' });
    // write collection files
    indexJson.forEach(function (index) {
        var sheetName = index['Sheet Name'];
        var sheet = book.Sheets[sheetName];
        var filename = fileParts.slice();
        filename.splice(-1, 0, sheetName);
        XLSX.writeFile(book, filename.join('.'), { bookType: 'csv', sheet: sheetName });
    });
}
function json2book(json) {
    var book = XLSX.utils.book_new();
    var collPrefixSliceLength = args.collPrefix.length + 1;
    var collectionIndex = [];
    book.Props = __assign({}, book.Props, { Title: 'FireStore Export', Author: 'firestore-migrator', CreatedDate: new Date() });
    var addCollection = function (coll, path) {
        var sheetName = shortid.generate();
        var docs = [];
        // Turn key'd document objects into an array of flat documents objects, each with a document id
        _.forEach(coll, function (doc, id) {
            var _a;
            // process any sub-collections
            var subCollFields = Object.keys(doc).filter(function (key) { return key.startsWith(args.collPrefix + ':'); });
            subCollFields.forEach(function (name) {
                addCollection(doc[name], [path, id, name.slice(collPrefixSliceLength)].join('/'));
                delete (doc[name]);
            });
            // flatten objects
            var flatDoc = dot.dot(doc);
            docs.push(__assign((_a = {}, _a[args.idField] = id, _a), flatDoc));
        });
        // add collection sheet to book
        var sheet = XLSX.utils.json_to_sheet(docs);
        XLSX.utils.book_append_sheet(book, sheet, sheetName);
        // add an index entry
        collectionIndex.push({
            sheetName: sheetName,
            path: path,
            depth: path.split('/').length,
            count: docs.length
        });
    };
    // process collections
    _.forEach(json, function (coll, key) {
        addCollection(coll, key.slice(collPrefixSliceLength));
    });
    // index sheet
    var indexSheet = XLSX.utils.aoa_to_sheet([
        ['Sheet Name', 'Collection', 'Depth', 'Documents', 'Link']
    ]);
    collectionIndex.sort(shared_1.sortByKeysFn(['depth', 'path']));
    collectionIndex.forEach(function (coll, index) {
        var n = index + 2;
        indexSheet['!ref'] = "A1:E" + n;
        indexSheet["A" + n] = { t: 's', v: coll.sheetName };
        indexSheet["B" + n] = { t: 's', v: coll.path };
        indexSheet["C" + n] = { t: 'n', v: +coll.depth };
        indexSheet["D" + n] = { t: 'n', v: +coll.count };
        indexSheet["E" + n] = { t: 's', v: 'link', l: { Target: "#" + coll.sheetName + "!A1" } };
    });
    XLSX.utils.book_append_sheet(book, indexSheet, 'INDEX');
    return book;
}
//# sourceMappingURL=index.js.map