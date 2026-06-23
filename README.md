# The State of RTBH Support

The page documents which networks support Remote Triggered Black Hole (RTBH) filtering, and if so, what their implementation supports.

Please make pull requests to add additional networks or correct any mistakes.

## RTBH Support by Network

See the file [rtbh.csv](rtbh.csv) for the current state of RTBH support by network.

## Table Headers

The table headers are defined as follows:

- Network: The name of the network or Internet Exchange Point (IXP).
- ASN: The Autonomous System Number (ASN) which RTBH routes are advertised to (for IXPs this is the route server).
- Enabled by Default: Indicates whether the network has the feature enabled by default if you must explicitly enable it e.g. via a support ticket.
- V4 Min Length: The minimum IPv4 prefix length that will be accepted as RTBH routes.
- V4 Max Length: The maximum IPv4 prefix length that will be accepted as RTBH routes.
- V6 Min Length: The minimum IPv6 prefix length that will be accepted as RTBH routes.
- V6 Max Length: The maximum IPv6 prefix length that will be accepted as RTBH routes.
- IRR Validated: Indicates whether the network validates RTBH routes against Internet Routing Registry (IRR) derived prefix filters.
- ROA Validated: Indicates whether the network validates RTBH routes against Route Origin Authorizations.
- ROA Invalid Accepted: Indicates whether the network accepts a ROA invalid prefix (i.e., due to prefix length exceeding ROA maxLength) _because_ the RTBH community is present.
- ROA Covering Origin Validated: Indicates whether the network accepts a ROA invalid prefix (i.e., due to prefix length exceeding ROA maxLength) _because_ the RTBH community is present _and_ there exists a ROA for a covering prefix with the same origin ASN.
- ASPA Validated: Indicates whether the network validates RTBH routes against AS Path Authorizations.
- RTBH Community: Stores the community used by the network for indicating an RTBH route (e.g. RFC7999 65535:666 or a custom community). Some operators support other communities in addition to the RFC community or their custom community e.g., for blackholing in specific regions. That is not captured here, this field captures what their "global" or most widely reaching community is.
- Forwards RTBH Routes: Indicates whether the network forwards RTBH routes to their eBGP neighbors (upstreams/downstreams/peers).

Meaning of the values in the table:

* If a network doesn't support RTBH all columns are set to a dash `-`.
* Unknown values are set to a question mark `?`.
* If a network accepts ROA invalids due to the RTBH route exceeding maxLength then it doesn't perform a check if there is a ROA for the covering prefix with the same origin. Therefore `N/A` is used in the `ROA Invalid Accepted` column if `ROA Covering Origin Validated` is `Yes`, and vice versa, `N/A` is used in the `ROA Covering Origin Validated` column if `ROA Invalid Accepted` is `Yes`.

## References

* [RFC 7999 BLACKHOLE Community](https://www.ietf.org/rfc/rfc7999)
