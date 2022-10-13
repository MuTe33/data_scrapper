"use strict";
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    }
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
var admin = require("firebase-admin");
var _ = require("lodash");
var util_1 = require("util");
var db = admin.firestore();
var toType = function (obj) {
    return ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase();
};
var arrayOrObject = function (test) {
    return ((test instanceof Array) || (toType(test) === 'object'));
};
exports.cleanCollectionPath = function (path) {
    if (typeof path === 'string') {
        var p = ('/' + path + '/').replace(/\/{2,}/, '/').split('/').filter(function (v) { return !!v; }).join('/');
        return p || '/';
    }
    else {
        return exports.cleanCollectionPath(path.join('/'));
    }
};
exports.isCollectionPath = function (path) {
    var sections = exports.cleanCollectionPath(path).split('/').length;
    return sections % 2 === 1;
};
exports.isDocumentPath = function (path) {
    var sections = exports.cleanCollectionPath(path).split('/').length;
    return sections % 2 === 0;
};
// Field Handlers, en/decoders, etc
var FieldHandler = /** @class */ (function () {
    function FieldHandler(prefix) {
        if (prefix === void 0) { prefix = 'prefix'; }
        var _this = this;
        this.prefix = prefix;
        this.isDecodeType = function (key, val, doc) {
            return false;
        };
        this.decodeFn = function (key, val, doc) {
            return val;
        };
        this.decode = function (key, val, doc) {
            return JSON.stringify({ type: _this.prefix, data: _this.decodeFn(key, val, doc) });
        };
        this.isEncodeType = function (key, val, doc) {
            if (typeof val !== 'string')
                return false;
            return val.startsWith("{\"type\":\"" + _this.prefix + "\"");
        };
        this.encodeFn = function (key, val, doc) {
            var type = val.type, data = val.data;
            return data;
        };
        this.encode = function (key, val, doc) {
            return _this.encodeFn(key, JSON.parse(val), doc);
        };
    }
    return FieldHandler;
}());
var GeoPointFH = /** @class */ (function (_super) {
    __extends(GeoPointFH, _super);
    function GeoPointFH() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.isDecodeType = function (key, val, doc) {
            return (val instanceof admin.firestore.GeoPoint);
        };
        _this.encodeFn = function (key, val, doc) {
            var data = val.data;
            return new admin.firestore.GeoPoint(data._latitude, data._longitude);
        };
        return _this;
    }
    return GeoPointFH;
}(FieldHandler));
var BooleanFH = /** @class */ (function (_super) {
    __extends(BooleanFH, _super);
    function BooleanFH() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.isDecodeType = function (key, val, doc) {
            return (typeof val === 'boolean');
        };
        _this.encodeFn = function (key, val, doc) {
            var data = val.data;
            return data;
        };
        return _this;
    }
    return BooleanFH;
}(FieldHandler));
var TimeStampFH = /** @class */ (function (_super) {
    __extends(TimeStampFH, _super);
    function TimeStampFH() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.isDecodeType = function (key, val, doc) {
            return (val instanceof Date);
        };
        _this.encodeFn = function (key, val, doc) {
            var data = val.data;
            return new Date(data);
        };
        return _this;
    }
    return TimeStampFH;
}(FieldHandler));
var NumberFH = /** @class */ (function (_super) {
    __extends(NumberFH, _super);
    function NumberFH() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.isDecodeType = function (key, val, doc) {
            return (typeof val === 'number');
        };
        return _this;
    }
    return NumberFH;
}(FieldHandler));
var ReferenceFH = /** @class */ (function (_super) {
    __extends(ReferenceFH, _super);
    function ReferenceFH() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.isDecodeType = function (key, val, doc) {
            return (val instanceof admin.firestore.DocumentReference);
        };
        _this.decodeFn = function (key, val, doc) {
            return val.path;
        };
        _this.encodeFn = function (key, val, doc) {
            var data = val.data;
            return db.doc(data);
        };
        return _this;
    }
    return ReferenceFH;
}(FieldHandler));
var NullFH = /** @class */ (function (_super) {
    __extends(NullFH, _super);
    function NullFH() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.isDecodeType = function (key, val, doc) {
            return util_1.isNull(val);
        };
        _this.decode = function (key, val, doc) {
            return JSON.stringify({ type: _this.prefix });
        };
        _this.encode = function (key, val, doc) {
            return null;
        };
        return _this;
    }
    return NullFH;
}(FieldHandler));
var ArrayOrObjectFH = /** @class */ (function (_super) {
    __extends(ArrayOrObjectFH, _super);
    function ArrayOrObjectFH() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.isDecodeType = function (key, val, doc) {
            return arrayOrObject(val);
        };
        _this.decode = function (key, val, doc) {
            decodeDoc(val);
            return val;
        };
        _this.isEncodeType = function (key, val, doc) {
            return arrayOrObject(val);
        };
        _this.encode = function (key, val, doc) {
            encodeDoc(val);
            return val;
        };
        return _this;
    }
    return ArrayOrObjectFH;
}(FieldHandler));
var TestFH = /** @class */ (function (_super) {
    __extends(TestFH, _super);
    function TestFH() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.isDecodeType = function (key, val, doc) {
            if (['_a'].includes(key)) {
                // if (1) {
                console.log("Test isDecode on " + key + " = " + toType(val));
                console.log('typeof', typeof val);
                console.log('instanceof', val instanceof Object);
                console.log('isNull', util_1.isNull(val));
                console.log('val', val);
            }
            return false;
        };
        _this.isEncodeType = function (key, val, doc) {
            if (key === 'o') {
                console.log("Test isEncode on " + key + " = " + toType(val));
                console.log('typeof', typeof val);
                console.log('instanceof', val instanceof Object);
                console.log('val', val);
            }
            return false;
        };
        return _this;
    }
    return TestFH;
}(FieldHandler));
//  decodeDoc() and encodeDoc() traverses specialFieldTypes[] in order of appearance for every field (and nested fields)
//  of every document of every collection, and uses only the first matched handler per field.
//  So list FieldHandlers by descending order of your typical field type use. But always keep ArrayOrObjectFH last, since matching 
//  objects is tricky and will result in a false positives if moved up the chain.
var specialFieldTypes = [
    // new TestFH('test'),
    new GeoPointFH('geopoint'),
    new BooleanFH('bool'),
    new TimeStampFH('timestamp'),
    new NumberFH('number'),
    new ReferenceFH('ref'),
    new NullFH('null'),
    new ArrayOrObjectFH()
];
// Decode from Firestore field
function decodeDoc(doc) {
    _.forEach(doc, function (fieldValue, fieldName) {
        var fieldHandler = specialFieldTypes.find(function (fieldHandler) { return fieldHandler.isDecodeType(fieldName, fieldValue, doc); });
        if (!fieldHandler)
            return;
        doc[fieldName] = fieldHandler.decode(fieldName, fieldValue, doc);
    });
}
exports.decodeDoc = decodeDoc;
// Encode to Firestore field
function encodeDoc(doc) {
    _.forEach(doc, function (fieldValue, fieldName) {
        var fieldHandler = specialFieldTypes.find(function (fieldHandler) { return fieldHandler.isEncodeType(fieldName, fieldValue, doc); });
        if (!fieldHandler)
            return;
        doc[fieldName] = fieldHandler.encode(fieldName, fieldValue, doc);
    });
}
exports.encodeDoc = encodeDoc;
function sortByKeysFn(keys) {
    var _a;
    var sortTuples = [];
    var dir = 'ASC';
    if (typeof keys === 'string') {
        sortTuples.push((_a = {}, _a[keys] = dir, _a));
    }
    else {
        _.forEach(keys, function (key) {
            var _a;
            return sortTuples.push(typeof key === 'string' ? (_a = {}, _a[key] = dir, _a) : key);
        });
    }
    return function (a, b) {
        var sort = 0;
        for (var _i = 0, sortTuples_1 = sortTuples; _i < sortTuples_1.length; _i++) {
            var tuple = sortTuples_1[_i];
            if (sort !== 0)
                break;
            for (var key in tuple) {
                if (tuple[key] === 'ASC') {
                    sort = a[key] > b[key] ? 1
                        : a[key] < b[key] ? -1
                            : 0;
                }
                else {
                    sort = a[key] > b[key] ? -1
                        : a[key] < b[key] ? 1
                            : 0;
                }
            }
        }
        return sort;
    };
}
exports.sortByKeysFn = sortByKeysFn;
//# sourceMappingURL=shared.js.map