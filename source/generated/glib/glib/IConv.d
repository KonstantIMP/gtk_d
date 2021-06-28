module glib.IConv;

private import glib.Str;
private import glib.c.functions;
public  import glib.c.types;


/**
 * The GIConv struct wraps an iconv() conversion descriptor. It contains
 * private data and should only be accessed using the following functions.
 */

/**
 * Same as the standard UNIX routine iconv(), but
 * may be implemented via libiconv on UNIX flavors that lack
 * a native implementation.
 *
 * GLib provides g_convert() and g_locale_to_utf8() which are likely
 * more convenient than the raw iconv wrappers.
 *
 * Note that the behaviour of iconv() for characters which are valid in the
 * input character set, but which have no representation in the output character
 * set, is implementation defined. This function may return success (with a
 * positive number of non-reversible conversions as replacement characters were
 * used), or it may return -1 and set an error such as %EILSEQ, in such a
 * situation.
 *
 * Params:
 *     inbuf = bytes to convert
 *     outbuf = converted output bytes
 *
 * Returns: count of non-reversible conversions, or -1 on error
 */
public size_t iconv(GIConv converter, ref string inbuf, ref string outbuf)
{
	char* outinbuf = Str.toStringz(inbuf);
	size_t inbytesLeft;
	char* outoutbuf = Str.toStringz(outbuf);
	size_t outbytesLeft;

	auto __p = g_iconv(converter, &outinbuf, &inbytesLeft, &outoutbuf, &outbytesLeft);

	inbuf = Str.toString(outinbuf, inbytesLeft);
	outbuf = Str.toString(outoutbuf, outbytesLeft);

	return __p;
}

/**
 * Same as the standard UNIX routine iconv_close(), but
 * may be implemented via libiconv on UNIX flavors that lack
 * a native implementation. Should be called to clean up
 * the conversion descriptor from g_iconv_open() when
 * you are done converting things.
 *
 * GLib provides g_convert() and g_locale_to_utf8() which are likely
 * more convenient than the raw iconv wrappers.
 *
 * Returns: -1 on error, 0 on success
 */
public int close(GIConv converter)
{
	return g_iconv_close(converter);
}

/**
 * Same as the standard UNIX routine iconv_open(), but
 * may be implemented via libiconv on UNIX flavors that lack
 * a native implementation.
 *
 * GLib provides g_convert() and g_locale_to_utf8() which are likely
 * more convenient than the raw iconv wrappers.
 *
 * Params:
 *     toCodeset = destination codeset
 *     fromCodeset = source codeset
 *
 * Returns: a "conversion descriptor", or (GIConv)-1 if
 *     opening the converter failed.
 */
public GIConv open(string toCodeset, string fromCodeset)
{
	return g_iconv_open(Str.toStringz(toCodeset), Str.toStringz(fromCodeset));
}
