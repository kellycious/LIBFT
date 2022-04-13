/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcat.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: khuynh <khuynh@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/30 22:19:02 by khuynh            #+#    #+#             */
/*   Updated: 2022/04/13 23:57:07 by khuynh           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stddef.h>

size_t	ft_strlcat(char *dst, const char *src, size_t dstsize)
{
	size_t	ldest;
	size_t	lsrc;
	size_t	i;
	size_t	j;

	ldest = 0;
	lsrc = 0;
	i = 0;
	j = 0;
	while (dst[ldest])
		ldest++;
	while (src[lsrc])
		lsrc++;
	while (j < dstsize && dst[j])
		j++;
	if (j == dstsize)
		return (lsrc + j);
	while (src[i])
	{
		if (ldest + 1 + i < dstsize)
			dst[j++] = src[i];
		i++;
	}
	dst[j] = '\0';
	return (ldest + i);
}

/*
#include <stdio.h>

int	main()
{
	const char a[8] = "tototo";
	char b[8] = "tata";
	printf("%zu", ft_strlcat(b, a, 2));
} 
*/
