module soup.ProxyResolverDefault;

private import gobject.ObjectG;
private import soup.ProxyURIResolverIF;
private import soup.ProxyURIResolverT;
private import soup.SessionFeatureIF;
private import soup.SessionFeatureT;
private import soup.c.functions;
public  import soup.c.types;


/** */
public class ProxyResolverDefault : ObjectG, ProxyURIResolverIF, SessionFeatureIF
{
	/** the main Gtk struct */
	protected SoupProxyResolverDefault* soupProxyResolverDefault;

	/** Get the main Gtk struct */
	public SoupProxyResolverDefault* getProxyResolverDefaultStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupProxyResolverDefault;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupProxyResolverDefault;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupProxyResolverDefault* soupProxyResolverDefault, bool ownedRef = false)
	{
		this.soupProxyResolverDefault = soupProxyResolverDefault;
		super(cast(GObject*)soupProxyResolverDefault, ownedRef);
	}

	// add the ProxyURIResolver capabilities
	mixin ProxyURIResolverT!(SoupProxyResolverDefault);

	// add the SessionFeature capabilities
	mixin SessionFeatureT!(SoupProxyResolverDefault);


	/** */
	public static GType getType()
	{
		return soup_proxy_resolver_default_get_type();
	}
}
